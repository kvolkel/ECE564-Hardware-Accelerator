module step2(
	     input [15:0]  z0,
	     input [15:0]  z1,
	     input [15:0]  z2,
	     input [15:0]  z3,
	     input 	   data_ready,
	     input [3:0]   RF2_Address_R,
	     input 	   clear_2,
	     input [3:0]   RF2_Address_W,
	     input [7:0]   Dot_Select,
	     input [15:0]  vector_data,
	     input [2:0]   out_select,
	     input 	   clock,
	     input [1:0]   RF2_Data_sel,
	     input 	   RF2_EN,
	     input 	   RF2_new_val;
	     output [15:0] output_data /*connect this directly to memory*/ );
 
   wire [15:0] 		   mux_RF_data;
   wire [15:0] 		   out_intermediate;
   wire [15:0] 		   out_0;
   wire [15:0] 		   out_1;
   wire [15:0] 		   out_2;
   wire [15:0] 		   out_3;
   wire [15:0] 		   out_4;
   wire [15:0] 		   out_5;
   wire [15:0] 		   out_6;
   wire [15:0] 		   out_7;
   








   
   //instantiate module of the input register and the RF Data mux
   input_data u1(.z0(z0),.z1(z1),.z2(z2),.z3(z3),.select(RF2_Data_sel),.clock(clock),.data_ready(data_ready),.out_data(mux_RF_data));

   //instantiate the RF2 register file
   register_file_2 u2(.EN(RF2_EN),.clock(clock),.address_W(RF2_Address_W),.RF_Data(mux_RF_data),.address_R(RF2_Address_R),.RF_out(out_intermediate));

   //instantiate the 8 dot product units
   dot O0(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[0]), ._min(out_0));

   dot O1(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[1]), ._min(out_1));

   dot O2(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[2]), ._min(out_2));

   dot O3(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[3]), ._min(out_3));
   
   dot O4(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[4]), ._min(out_4));

   dot O5(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[5]), ._min(out_5));

   dot O6(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[6]), ._min(out_6));

   dot O7(.filter_element(vector_data),.data_element(out_intermediate),.new_val(RF2_new_val), .clock(clock),.clear(clear_2),.hold(Dot_Select[7]), ._min(out_7));


   //instantiate output module (contains the regsiter that interfaces to the output data memory

   output_data u4(.clock(clock),.O7(out_7),.O6(out_6),.O5(out_5),.O4(out_4),.O3(out_3),.O2(out_2),.O1(out_1),.O0(out_0),.select(out_select),.OUT(output_data));
endmodule // step2
