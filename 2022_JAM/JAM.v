// -----------------------------------------------------------------------------
// IC contest 2022: Job Assignment Machine
// -----------------------------------------------------------------------------

module JAM (
    input CLK,
    input RST,
    output [3:0] MatchCount,
    output [9:0] MinCost,
    output       Valid,

    output [2:0] W,
    output [2:0] J,
    input  [6:0] Cost
);

// -----------------------------------------------------------------------------
// parameters & loop indices
// -----------------------------------------------------------------------------
parameter S_FIND_LEFT   = 0;
parameter S_FIND_RIGHT  = 1;
parameter S_TURN_TO_END = 2;
parameter S_REVERSE     = 3;
parameter S_WAIT_ADDER  = 4;

parameter AS_WAIT_PERM  = 0;
parameter AS_ADD_COST   = 1;
parameter AS_UPDATE_MIN = 2;

parameter MAX_COST = 1023;

integer i;

// -----------------------------------------------------------------------------
// signals
// -----------------------------------------------------------------------------
// control wires
reg finished, next_finished;
reg find_left_swap, find_right_swap;

// permutation FSM
reg [2:0] perm_state, next_perm_state;
reg [2:0] shift_count, next_shift_count;
reg [2:0] turn_count, next_turn_count;

// permutation registers
reg [2:0] perm [0:7], next_perm [0:7];
reg [2:0] perm_ext [0:5], next_perm_ext [0:5];
reg [2:0] perm_turn [0:5], next_perm_turn [0:5];

// cost adder FSM
reg [1:0] adder_state, next_adder_state;
reg [3:0] adder_count, next_adder_count;

// cost adder
reg [9:0] psum, next_psum;
reg [9:0] min_cost, next_min_cost;
reg [3:0] min_count, next_min_count;

// worker / job shift registers
reg [2:0] workers [0:7], next_workers [0:7];
reg [2:0] jobs    [0:7], next_jobs    [0:7];

// -----------------------------------------------------------------------------
// outputs
// -----------------------------------------------------------------------------
assign MatchCount = min_count;
assign MinCost = min_cost;
assign Valid = finished;

assign W = workers[0];
assign J = jobs[0];

// -----------------------------------------------------------------------------
// permutation FSM
// -----------------------------------------------------------------------------
always @(*) begin
    // next permutation state
    case (perm_state)
        S_FIND_LEFT:   next_perm_state = (find_left_swap)  ? S_FIND_RIGHT : S_FIND_LEFT;
        S_FIND_RIGHT:  next_perm_state = (find_right_swap) ? S_TURN_TO_END : S_FIND_RIGHT;
        S_TURN_TO_END: next_perm_state = (turn_count == 0) ? S_REVERSE : S_TURN_TO_END;
        S_REVERSE: begin
            if (shift_count == 0) begin
                if (adder_state == AS_WAIT_PERM) begin
                    next_perm_state = S_FIND_LEFT;
                end
                else begin
                    next_perm_state = S_WAIT_ADDER;
                end
            end
            else begin
                next_perm_state = S_REVERSE;
            end
        end
        S_WAIT_ADDER: begin
            if (adder_state == AS_WAIT_PERM || !finished) begin
                next_perm_state = S_FIND_LEFT;
            end
            else begin
                next_perm_state = S_WAIT_ADDER;
            end
        end

        default: next_perm_state = S_FIND_LEFT;
    endcase

    // next permutation counts
    case (perm_state)
        S_FIND_LEFT: begin
            if (find_left_swap) begin
                next_shift_count = shift_count;
                next_turn_count = turn_count;
            end
            else begin
                next_shift_count = shift_count + 1;
                next_turn_count = turn_count + 1;
            end
        end
        S_FIND_RIGHT: begin
            next_shift_count = shift_count;
            if (find_right_swap) begin
                next_turn_count = turn_count;
            end
            else begin
                next_turn_count = turn_count - 1;
            end
        end
        S_TURN_TO_END: begin
            next_shift_count = shift_count;
            if (turn_count == 0) begin
                next_turn_count = 0;
            end
            else begin
                next_turn_count = turn_count - 1;
            end
        end
        S_REVERSE: begin
            if (shift_count == 0) begin
                next_shift_count = 0;
            end
            else begin
                next_shift_count = shift_count - 1;
            end
            next_turn_count = turn_count;
        end
        S_WAIT_ADDER: begin
            next_shift_count = 0;
            next_turn_count = 0;
        end

        default: begin
            next_shift_count = 0;
            next_turn_count = 0;
        end
    endcase
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        perm_state <= S_WAIT_ADDER;
        shift_count <= 0;
        turn_count <= 0;
    end
    else begin
        perm_state <= next_perm_state;
        shift_count <= next_shift_count;
        turn_count <= next_turn_count;
    end
end

// -----------------------------------------------------------------------------
// adder FSM
// -----------------------------------------------------------------------------
always @(*) begin
    // next adder state
    case (adder_state)
        AS_WAIT_PERM: begin
            if (perm_state == S_WAIT_ADDER 
                    || (perm_state == S_REVERSE && shift_count == 0)) begin
                next_adder_state = AS_ADD_COST;
            end
            else begin
                next_adder_state = AS_WAIT_PERM;
            end
        end
        AS_ADD_COST: begin
            if (adder_count == 8) begin
                next_adder_state = AS_UPDATE_MIN;
            end
            else begin
                next_adder_state = AS_ADD_COST;
            end
        end
        AS_UPDATE_MIN: next_adder_state = AS_WAIT_PERM;

        default: next_adder_state = AS_WAIT_PERM;
    endcase

    // next adder count
    case (adder_state)
        AS_WAIT_PERM: next_adder_count = 0;
        AS_ADD_COST: begin
            if (adder_count == 8) begin
                next_adder_count = 0;
            end
            else begin
                next_adder_count = adder_count + 1;
            end
        end
        AS_UPDATE_MIN: next_adder_count = 0;

        default: next_adder_count = 0;
    endcase
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        adder_state <= AS_WAIT_PERM;
        adder_count <= 0;
    end
    else begin
        adder_state <= next_adder_state;
        adder_count <= next_adder_count;
    end
end

// -----------------------------------------------------------------------------
// combinational part
// -----------------------------------------------------------------------------
always @(*) begin
    next_finished = (finished || (shift_count == 6 && !find_left_swap));

    // permutation control wires
    find_left_swap = (perm[6] > perm[7]);
    find_right_swap = (perm[6] >= perm_ext[0]);

    // next permutation registers
    case (perm_state)
        S_FIND_LEFT  : begin
            if (find_left_swap) begin
                for (i = 0; i <= 7; i = i + 1) begin
                    next_perm[i] = perm[i];
                end

                for (i = 0; i <= 5; i = i + 1) begin
                    next_perm_ext[i] = perm_ext[i];
                    next_perm_turn[i] = perm_turn[i];
                end
            end
            else begin
                next_perm[0] = 0;
                for (i = 1; i <= 7; i = i + 1) begin
                    next_perm[i] = perm[i-1];
                end

                next_perm_ext[0] = perm[7];
                for (i = 1; i <= 5; i = i + 1) begin
                    next_perm_ext[i] = perm_ext[i-1];
                end

                for (i = 0; i <= 5; i = i + 1) begin
                    next_perm_turn[i] = perm_turn[i];
                end
            end
        end
        S_FIND_RIGHT : begin
            if (find_right_swap) begin
                for (i = 0; i <= 6; i = i + 1) begin
                    next_perm[i] = perm[i];
                end
                next_perm[7] = perm_ext[0];  // swap

                next_perm_ext[0] = perm[7];  // swap
                for (i = 1; i <= 5; i = i + 1) begin
                    next_perm_ext[i] = perm_ext[i];
                end

                for (i = 0; i <= 5; i = i + 1) begin
                    next_perm_turn[i] = perm_turn[i];
                end
            end
            else begin
                for (i = 0; i <= 6; i = i + 1) begin
                    next_perm[i] = perm[i];
                end
                next_perm[7] = perm_ext[0];

                for (i = 0; i <= 4; i = i + 1) begin
                    next_perm_ext[i] = perm_ext[i+1];
                end
                next_perm_ext[5] = 0;

                next_perm_ext[0] = perm[7];
                for (i = 1; i <= 5; i = i + 1) begin
                    next_perm_turn[i] = perm_turn[i-1];
                end
            end
        end
        S_TURN_TO_END: begin
            for (i = 0; i <= 6; i = i + 1) begin
                next_perm[i] = perm[i];
            end

            if (turn_count == 0) begin
                next_perm[7] = perm[7];

                for (i = 0; i <= 5; i = i + 1) begin
                    next_perm_ext[i] = perm_ext[i];
                    next_perm_turn[i] = perm_turn[i];
                end
            end
            else begin
                next_perm[7] = perm_ext[0];

                for (i = 0; i <= 4; i = i + 1) begin
                    next_perm_ext[i] = perm_ext[i+1];
                end
                next_perm_ext[5] = 0;

                next_perm_ext[0] = perm[7];
                for (i = 1; i <= 5; i = i + 1) begin
                    next_perm_turn[i] = perm_turn[i-1];
                end
            end
        end
        S_REVERSE    : begin
            for (i = 0; i <= 5; i = i + 1) begin
                next_perm_ext[i] = perm_ext[i];
            end

            if (shift_count == 0) begin
                for (i = 0; i <= 7; i = i + 1) begin
                    next_perm[i] = perm[i];
                end

                for (i = 0; i <= 5; i = i + 1) begin
                    next_perm_turn[i] = 0;
                end
            end
            else begin
                for (i = 0; i <= 6; i = i + 1) begin
                    next_perm[i] = perm[i+1];
                end
                next_perm[7] = perm_turn[0];

                for (i = 0; i <= 4; i = i + 1) begin
                    next_perm_turn[i] = perm_turn[i+1];
                end
                next_perm_turn[5] = 0;
            end
        end
        S_WAIT_ADDER : begin
            for (i = 0; i <= 7; i = i + 1) begin
                next_perm[i] = perm[i];
            end
            for (i = 0; i <= 5; i = i + 1) begin
                next_perm_ext[i] = 0;
                next_perm_turn[i] = 0;
            end
        end

        default: begin
            for (i = 0; i <= 7; i = i + 1) begin
                next_perm[i] = perm[i];
            end
            for (i = 0; i <= 5; i = i + 1) begin
                next_perm_ext[i] = 0;
                next_perm_turn[i] = 0;
            end
        end
    endcase

    // next workers / jobs
    case (adder_state)
        AS_WAIT_PERM: begin
            if ((perm_state == S_WAIT_ADDER) || (perm_state == S_REVERSE && shift_count == 0)) begin
                for (i = 0; i <= 7; i = i + 1) begin
                    next_workers[i] = perm[i];
                end
            end
            else begin
                for (i = 0; i <= 7; i = i + 1) begin
                    next_workers[i] = workers[i];
                end
            end

            for (i = 0; i <= 7; i = i + 1) begin
                next_jobs[i] = jobs[i];
            end
        end
        AS_ADD_COST: begin
            for (i = 0; i <= 6; i = i + 1) begin
                next_workers[i] = workers[i+1];
                next_jobs[i] = jobs[i+1];
            end
            next_workers[7] = workers[0];
            next_jobs[7] = jobs[7];
        end
        AS_UPDATE_MIN: begin
            for (i = 0; i <= 7; i = i + 1) begin
                next_workers[i] = workers[i];
                next_jobs[i] = jobs[i];
            end
        end

        default: begin
            for (i = 0; i <= 7; i = i + 1) begin
                next_workers[i] = workers[i];
                next_jobs[i] = jobs[i];
            end
        end
    endcase

    // next psum
    case (adder_state)
        AS_WAIT_PERM:  next_psum = 0;
        AS_ADD_COST:   next_psum = psum + Cost;
        AS_UPDATE_MIN: next_psum = psum;

        default: next_psum = 0;
    endcase

    // next min cost / min count
    if (adder_state == AS_UPDATE_MIN) begin
        if (psum < min_cost) begin
            next_min_cost = psum;
            next_min_count = 1;
        end
        else if (psum == min_cost) begin
            next_min_cost = min_cost;
            next_min_count = min_count + 1;
        end
        else begin
            next_min_cost = min_cost;
            next_min_count = min_count;
        end
    end
    else begin
        next_min_cost = min_cost;
        next_min_count = min_count;
    end
end

// -----------------------------------------------------------------------------
// sequential part
// -----------------------------------------------------------------------------
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        finished <= 0;
        for (i = 0; i <= 7; i = i + 1) begin
            perm[i] <= i;
        end
        for (i = 0; i <= 5; i = i + 1) begin
            perm_ext[i]  <= 0;
            perm_turn[i] <= 0;
        end
        for (i = 0; i <= 7; i = i + 1) begin
            workers[i] <= 0;
            jobs[i]    <= i;
        end
        adder_count <= 0;
        psum <= 0;
        min_cost <= MAX_COST;
        min_count <= 1;
    end 
    else begin
        finished <= next_finished;
        for (i = 0; i <= 7; i = i + 1) begin
            perm[i] <= next_perm[i];
        end
        for (i = 0; i <= 5; i = i + 1) begin
            perm_ext[i]  <= next_perm_ext[i];
            perm_turn[i] <= next_perm_turn[i];
        end
        for (i = 0; i <= 7; i = i + 1) begin
            workers[i] <= next_workers[i];
            jobs[i]    <= next_jobs[i];
        end
        adder_count <= next_adder_count;
        psum <= next_psum;
        min_cost <= next_min_cost;
        min_count <= next_min_count;
    end
end

endmodule


