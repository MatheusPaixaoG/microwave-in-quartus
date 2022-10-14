module decoder_7(output wire [6:0] sec_ones_segs, sec_tens_segs, mins_segs,
                input wire  [3:0] sec_ones,sec_tens,min);

/*
O relógio do segmento está dividido em 3 partes: a dos segundos, a das dezenas de segundos 
e a dos minutos.
O segmento dos segundos recebe sec_ones e dá como resultado sec_ones_segs;
O segmento das dezenas de segundos recebe sec_tens e dá como resultado sec_tens_segs;
O segmento dos minutos recebe mins e dá como resultado mins_segs;
Cada um dos assign's a seguir decodifica um código BCD recebido para o código de 7 dígitos 
do segmento correspondente.
*/
assign sec_ones_segs =  (sec_ones == 4'b0000) ? 7'b111_1110:
                        (sec_ones == 4'b0001) ? 7'b011_0000:
                        (sec_ones == 4'b0010) ? 7'b110_1101:
                        (sec_ones == 4'b0011) ? 7'b111_1001:
                        (sec_ones == 4'b0100) ? 7'b011_0011:
                        (sec_ones == 4'b0101) ? 7'b101_1011:
                        (sec_ones == 4'b0110) ? 7'b101_1111:
                        (sec_ones == 4'b0111) ? 7'b111_0000:
                        (sec_ones == 4'b1000) ? 7'b111_1111:
                        (sec_ones == 4'b1001) ? 7'b111_0011:
                        8'bXXXX_XXXX;


assign sec_tens_segs =  (sec_tens == 4'b0000) ? 7'b111_1110:
                        (sec_tens == 4'b0001) ? 7'b011_0000:
                        (sec_tens == 4'b0010) ? 7'b110_1101:
                        (sec_tens == 4'b0011) ? 7'b111_1001:
                        (sec_tens == 4'b0100) ? 7'b011_0011:
                        (sec_tens == 4'b0101) ? 7'b101_1011:
                        (sec_tens == 4'b0110) ? 7'b101_1111:
                        (sec_tens == 4'b0111) ? 7'b111_0000:
                        (sec_tens == 4'b1000) ? 7'b111_1111:
                        (sec_tens == 4'b1001) ? 7'b111_0011:
                        8'bXXXX_XXXX;

assign mins_segs =   (min == 4'b0000)? 7'b111_1110:
                    (min == 4'b0001) ? 7'b011_0000:
                    (min == 4'b0010) ? 7'b110_1101:
                    (min == 4'b0011) ? 7'b111_1001:
                    (min == 4'b0100) ? 7'b011_0011:
                    (min == 4'b0101) ? 7'b101_1011:
                    (min == 4'b0110) ? 7'b101_1111:
                    (min == 4'b0111) ? 7'b111_0000:
                    (min == 4'b1000) ? 7'b111_1111:
                    (min == 4'b1001) ? 7'b111_0011:
                    8'bXXXX_XXXX;


endmodule
