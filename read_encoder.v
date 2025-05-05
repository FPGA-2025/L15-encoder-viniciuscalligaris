module Read_Encoder (
    input wire clk,
    input wire rst_n,

    input wire A,
    input wire B,

    output reg [1:0] dir
);

    always @(posedge clk) begin
        if (!rst_n) begin
            dir <= 2'b00;
        end else begin
        if (A) begin
            dir <= 2'b01; 
        end else begin
        if (B) begin
            dir <= 2'b10; 
        end else begin
            dir <= 2'b00;
        end
        end
        end
    end
    
endmodule
