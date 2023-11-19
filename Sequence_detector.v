module sequence_detector #(
	parameter 
	null = 2'b00,
	s0 = 2'b01,
	s1 = 2'b10,
	s2 = 2'b11)
     (
	input wire IN,
	input wire clk,
	input wire reset_n,
	output reg OUT);
	
	reg [1:0] current_state;
	reg [1:0] next_state;

  always@(IN or current_state)
	begin
	case (current_state)
	
	null: begin
	if (IN == 1) begin
	next_state = s0;
	end
	else next_state = null;
	end
	
	s0: begin
	if (IN == 1) begin
	next_state = s0;
	end
	else next_state = s1;
	end

	s1: begin
	if (IN == 1) begin
	next_state = s2;
	end
	else next_state = null;
	end

	s2: begin
	if (IN == 1) begin
	next_state = s0;
	end
	else next_state = s1;
	end

	default: next_state = null;

	endcase
  end

  always@(posedge clk) begin
	if (reset_n == 1'b0)
	current_state <= next_state;
	else current_state <= null;
  end

	assign OUT = current_state? 1:0;
	
	endmodule
