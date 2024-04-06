module input_data(input [15:0] z0, input [15:0] z1, input [15:0] z2, input [15:0] z3, input [1:0] select,input clock,input data_ready, output reg [15:0] out_data);

   reg [15:0] z0_reg;
   reg [15:0] z1_reg;
   reg [15:0] z2_reg;
   reg [15:0] z3_reg;
   always @ (posedge clock) begin
      if(data_ready) begin
	 z0_reg<=z0;
	 z1_reg<=z1;
	 z2_reg<=z2;
	 z3_reg<=z3;
      end
   end
   always @(*) begin
      case(select) begin
	 2'd0: out_data=z0_reg;
	 2'd1: out_data=z1_reg;
	 2'd2: out_data=z2_reg;
	 2'd3: out_data=z3_reg;
      endcase // case (select)
   end
endmodule // input_data

	     
   
