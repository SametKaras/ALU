module TopModule(
  input [3:0] A, B,
  input [2:0] Opcode,
  output reg [3:0] Result
);
  wire [3:0] result_add;
  wire [3:0] result_sub;
  wire [3:0] result_and;
  wire [3:0] result_or;
  wire [3:0] result_xor;
  wire Carry_out;

  // Addition module
  Addition_4bit adder(.A(A), .B(B), .Sum(result_add), .Carry(Carry_out));

  // Subtraction module
  Subtraction_4bit subtractor(.A(A), .B(B), .Difference(result_sub), .Borrow(Carry_out));

  // Bitwise AND module
  BitwiseAND_4bit and_gate(.A(A), .B(B), .Result(result_and));

  // Bitwise OR module
  BitwiseOR_4bit or_gate(.A(A), .B(B), .Result(result_or));

  // Bitwise XOR module
  BitwiseXOR_4bit xor_gate(.A(A), .B(B), .Result(result_xor));

  // Multiplexor for selecting the operation based on Opcode
  always @*
  begin
    case (Opcode)
      3'b000: Result = result_add;       // Addition
      3'b001: Result = result_sub;       // Subtraction
      3'b010: Result = result_and;       // Bitwise AND
      3'b011: Result = result_or;       // Bitwise OR
      3'b100: Result = result_xor;       // Bitwise XOR
      default: Result = 4'b0;      // Default value
    endcase
  end

endmodule