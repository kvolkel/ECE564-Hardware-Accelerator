module output_data(input clock,input [15:0] O7, input [15:0] O6, input [15:0] O5, input [15:0] O4, input [15:0] O3, input [15:0]  O2, input [15:0] O1, input [15:0] O0, input [2:0] select, output [15:0] OUT);
   always @ (posedge clock) begin
      casex (select)
	3'd0: OUT<=O0;
	3'd1: OUT<=O1;
	3'd2: OUT<=O2;
	3'd3: OUT<=O3;
	3'd4: OUT<=O4;
	3'd5: OUT<=O5;
	3'd6: OUT<=O6;
	3'd7: OUT<=O7;
      endcase // casex (select)
   end // always @ (posedge clock)
endmodule // output_data


	
	
