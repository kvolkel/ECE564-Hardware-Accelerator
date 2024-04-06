  module register_file_2(input EN,input clock,input [3:0] address_W, input [15:0] RF_Data, input [3:0] address_R, output reg [15:0] RF_out);

   parameter width=16;

   parameter entries=16;


   reg [width-1:0] regsiters [entries-1:0];


      always @ posedge(clock) begin
	       if(EN)
		 registers[address_W]<=RF_data;
      end
      always @(*) begin
	 RF_out=registers[address_R];
      end
endmodule // register_file_1




