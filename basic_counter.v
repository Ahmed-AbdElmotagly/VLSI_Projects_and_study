/*
module counter (invalue,up,load,clk,reset,count,full);
parameter width=4;
  input [width-1:0] invalue  ;
  input up,load,clk,reset;
  output reg [width-1:0] count ;
  output reg full;
  */
//  /*assign full = (count==(4'd15));*/
/*  
  always@(posedge clk)
	begin 
		if (reset) count=0;
			else begin
				if (load==1) count<=invalue;
					else if (up==1) 
                      if (count==15) full=1;
							else  count=count+1; 					
					else count=count;  
					
					end
end

endmodule 
*/
//###########################################################
// same previous counter but different style
module counter_lab2
	#(parameter width=4)
	(
	input wire [width-1:0] Invalue,
	input wire UP,RESET,
	input wire Load,CLK,
	output reg FULL,
	output reg [width-1:0] Count);
	
	always@(posedge CLK) 
	begin
	
	if (RESET == 1'b1) begin
	Count <= 1'b0;
	end
	
	else	begin 
	
	if (Load == 1'b1) begin
	
	Count <= Invalue;
	
	end
	
	else 	begin 
	
	if (UP == 1'b1) begin 
	
	Count <= Count + 1;
	
	if (Count == 4'd15) begin
	FULL <= 1'b1;
	end
	else 	begin
	FULL <= 1'b0;
	end
	
	end
	
	else	begin
	Count <= Count;
	end	
	end
	
	end
	end
	
endmodule
