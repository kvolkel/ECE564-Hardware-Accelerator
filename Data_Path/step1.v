module step1(
	     input [15:0] 	input_data, 
	     input 		Dot_HOLD, 
	     input [15:0] 	vector_data, 
	     input 		r_w1,
	     input 		clear1, 
	     input 		new_val, 
	     input [3:0] 	RF1_address, 
	     input [3:0] 	RF_EN,
	     input 		clock, 
	     output wire [15:0] z0, 
	     output wire [15:0] z1, 
	     output wire [15:0] z2, 
	     output wire [15:0] z3
	     );

   wire [15:0] b3_output;
   wire [15:0] b2_output;
   wire [15:0] b1_output;
   wire [15:0] b0_output;
   


   //instantiate the register files
   register_file_1 b3(.EN(RF_EN[3]),.clock(clock),.r_w(r_w1),.RF_Data(vector_data),.address(RF1_address),.RF_Out(b3_output));
 
   register_file_1 b2(.EN(RF_EN[2]),.clock(clock),.r_w(r_w1),.RF_Data(vector_data),.address(RF1_address),.RF_Out(b2_output));
   
   register_file_1 b1(.EN(RF_EN[1]),.clock(clock),.r_w(r_w1),.RF_Data(vector_data),.address(RF1_address),.RF_Out(b1_output));
   
   register_file_1 b0(.EN(RF_EN[0]),.clock(clock),.r_w(r_w1),.RF_Data(vector_data),.address(RF1_address),.RF_Out(b0_output));

   //instantiate the dot product units
   dot z3(.filter_element(b3_output),.data_element(input_data),.new_val(new_val), .clock(clock),.clear(clear1),.hold(Dot_HOLD), ._min(z3));
   dot z2(.filter_element(b2_output),.data_element(input_data),.new_val(new_val), .clock(clock),.clear(clear1),.hold(Dot_HOLD), ._min(z2));
   dot z1(.filter_element(b1_output),.data_element(input_data),.new_val(new_val), .clock(clock),.clear(clear1),.hold(Dot_HOLD), ._min(z1));
   dot z0(.filter_element(b1_output),.data_element(input_data),.new_val(new_val), .clock(clock),.clear(clear1),.hold(Dot_HOLD), ._min(z0));
endmodule // step1
