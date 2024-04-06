module register_file_1(input EN,input clock,input r_w, input [15:0] RF_Data, input [3:0] address, output reg [15:0] RF_out);
   parameter width=16;
   parameter entries=9;
   
   reg [width-1:0] regsiters [entries-1:0];
   
   always @ posedge(clock) begin
      if(r_w && EN)
	registers[address]<=RF_data;
   end
   always @(*) begin
      if(r_w)
	RF_out=regsiters[0];
      else
	RF_out=registers[address];
   end
endmodule
   
