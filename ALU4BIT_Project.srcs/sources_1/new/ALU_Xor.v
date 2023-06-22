module BitwiseXOR_4bit(
  input [3:0] A, B,
  output reg [3:0] Result
);
  
  always @*
  begin
    Result = A ^ B;
  end
  
endmodule