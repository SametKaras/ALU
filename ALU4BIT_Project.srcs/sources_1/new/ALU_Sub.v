module Subtraction_4bit(
  input [3:0] A, B,
  output reg [3:0] Difference,
  output reg Borrow
);
  
  always @*
  begin
    Difference = A - B;
    Borrow = (A[3] & ~B[3]) | (A[2] & ~B[2]) | (A[1] & ~B[1]) | (A[0] & ~B[0]);
  end
  
endmodule