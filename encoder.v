module Encoder (
    input wire clk,
    input wire rst_n,

    input wire horario,
    input wire antihorario,

    output reg A,
    output reg B
);
    reg [1:0] sinal;

    always @(sinal) begin
        A = sinal[1];
        B = sinal[0];
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            sinal <= 2'b00;
        end else begin
        if (horario && antihorario) begin
            sinal <= 2'b00;
        end else begin
        if (horario && !antihorario) begin
            case (sinal)
                2'b00: sinal <= 2'b10;
                2'b10: sinal <= 2'b11;
                2'b11: sinal <= 2'b01;
                2'b01: sinal <= 2'b00;
                default: sinal <= 2'b00;
            endcase
        end else begin
        if (antihorario && !horario) begin
            case (sinal)
                2'b00: sinal <= 2'b01;
                2'b01: sinal <= 2'b11;
                2'b11: sinal <= 2'b10;
                2'b10: sinal <= 2'b00;
                default: sinal <= 2'b00;
            endcase
        end else begin
            sinal <= 2'b00;
        end
        end
        end
        end
    end
   
endmodule
