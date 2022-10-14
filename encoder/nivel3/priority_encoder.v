module priority_encoder(output reg [3:0] saidaBCD,
                        output wire loadn,
                        input wire [9:0] teclado, 
                        input wire enablen);

// Mapeamento de teclas usado                        
/*
IDLE = 0000000000 (SEM ENTRADAS NO TECLADO) 
0    = 0000000001
1    = 0000000010
2    = 0000000100
3    = 0000001000
4    = 0000010000
5    = 0000100000
6    = 0001000000
7    = 0010000000
8    = 0100000000
9    = 1000000000
*/
    // loadn será ativo em nível baixo, então ele só é 0 e ativa o contador_7_n_reciclável
    // quando enablen for 0 e alguma tecla está sendo pressionada
    assign loadn = (enablen | ~(teclado[0] | teclado[1] | teclado[2] | teclado[3] | teclado[4] | teclado[5] | teclado[6] | teclado[7] | teclado[8] | teclado[9]));
    always @(teclado) 
        begin
		    if (!enablen) begin
            casex (teclado)
                10'b0000000001 : saidaBCD = 4'b0000;
                10'b000000001x : saidaBCD = 4'b0001;
                10'b00000001xx : saidaBCD = 4'b0010;
                10'b0000001xxx : saidaBCD = 4'b0011;
                10'b000001xxxx : saidaBCD = 4'b0100;
                10'b00001xxxxx : saidaBCD = 4'b0101;
                10'b0001xxxxxx : saidaBCD = 4'b0110;
                10'b001xxxxxxx : saidaBCD = 4'b0111;
                10'b01xxxxxxxx : saidaBCD = 4'b1000;
                10'b1xxxxxxxxx : saidaBCD = 4'b1001;
                default: saidaBCD = 4'b0000;
            endcase
			  end
        end
endmodule