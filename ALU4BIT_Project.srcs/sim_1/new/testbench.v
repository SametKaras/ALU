module TopModule_Test;
  
  reg [3:0] A, B;
  reg [2:0] Opcode;
  wire [3:0] Result;
  
  // Instantiate the TopModule
  TopModule dut (
    .A(A),
    .B(B),
    .Opcode(Opcode),
    .Result(Result)
  );
  
  // Clock generation
  reg clk;
  always #5 clk = ~clk;
  
  // Testbench stimulus
  initial begin
    // Initialize inputs
    A = 4'b0101;
    B = 4'b0010;
    Opcode = 3'b000;  // Addition operation
    clk = 0;
    
    // Test Addition operation
    @(posedge clk);
    $display("Addition Test 1: A + B = %b", Result);
    
    A = 4'b1010;
    B = 4'b1100;
    @(posedge clk);
    $display("Addition Test 2: A + B = %b", Result);
    
    // Test Subtraction operation
    A = 4'b0101;
    B = 4'b0010;
    Opcode = 3'b001;  // Subtraction operation
    @(posedge clk);
    $display("Subtraction Test 1: A - B = %b", Result);
    
    A = 4'b1010;
    B = 4'b1100;
    @(posedge clk);
    $display("Subtraction Test 2: A - B = %b", Result);
    
    // Test Bitwise AND operation
    A = 4'b0101;
    B = 4'b0010;
    Opcode = 3'b010;  // Bitwise AND operation
    @(posedge clk);
    $display("Bitwise AND Test 1: A & B = %b", Result);
    
    A = 4'b1010;
    B = 4'b1100;
    @(posedge clk);
    $display("Bitwise AND Test 2: A & B = %b", Result);
    
    // Test Bitwise OR operation
    A = 4'b0101;
    B = 4'b0010;
    Opcode = 3'b011;  // Bitwise OR operation
    @(posedge clk);
    $display("Bitwise OR Test 1: A | B = %b", Result);
    
    A = 4'b1010;
    B = 4'b1100;
    @(posedge clk);
    $display("Bitwise OR Test 2: A | B = %b", Result);
    
    // Test Bitwise XOR operation
    A = 4'b0101;
    B = 4'b0010;
    Opcode = 3'b100;  // Bitwise XOR operation
    @(posedge clk);
    $display("Bitwise XOR Test 1: A ^ B = %b", Result);
    
    A = 4'b1010;
    B = 4'b1100;
    @(posedge clk);
    $display("Bitwise XOR Test 2: A ^ B = %b", Result);
    
    // End simulation
    $finish;
  end
  
endmodule