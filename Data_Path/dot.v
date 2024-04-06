module dot(input signed [15:0] filter_element, input signed [15:0] data_element,input new_val, input clock, input clear, input hold, output signed reg [15:0]  _min);
   signed reg [15:0] Result;
   signed  wire [31:0] mul;
   signed wire [15:0] trun;
   signed wire [15:0] addition;


   assign mul=filter_element*data_element;
   assign trun=mul>>16;
   assign addition=Result+trun;

   always @(posedge clock) begin
     if(clear) Result<=16'd0;
     else if(hold) Result<=Result;
     else if(new_val) Result<=mul;
     else Result=addition;
   end
   always @(*) begin
      if(Result[15]) _min=16'd0;
      else _min=Result;
   end
endmodule // dot

   
   
