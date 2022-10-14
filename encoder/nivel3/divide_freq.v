module divide_freq (input wire clock,
                    output reg Hz1);

    reg [6:0] contador = 26'b0000000; 
	 parameter DIVISOR = 26'd50000000;

    always @(posedge clock) begin
        if (contador >= (DIVISOR) - 1) begin // Quando contador=99, ele terá sido incrementado para 100
            contador <= 0; // Para reiniciar o divisor de frequência, contador volta a ser 0
				Hz1 <= 1'd1;
        end
		  else begin
				contador <= contador + 1; // "contador" será incrementado a cada borda positiva do relógio
				Hz1 <= 1'd0;
		  end
    end 

endmodule