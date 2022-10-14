module timer (output wire [3:0] sec_ones, sec_tens, mins, 
    output wire zero, 
    input wire clk, clearn, EN, loadn,
    input wire [3:0] data);

    // Fios internos para realizar as conexões entre os contadores do timer
    wire [3:0] ones_sec, tens, ones_min;
    wire tc_sec, zero_sec, tc_mins, zero_mins, tc_dez, zero_dez;
    wire carry_out; // Bit de carry_out, que serve para saber se o número entrado no campo das 
                    // dezenas de segundos é maior que 5 e, consequentemente, incrementar o 
                    // número dos minutos em 1.

    // unidades dos segundos -> 0,1,2,3,4,5,6,7,8,9
    Counter_mod_10 sec_unit(ones_sec,tc_sec,zero_sec,clk,clearn, EN, loadn, data); 
    // dezenas dos segundos -> 0,1,2,3,4,5,6
    Counter_mod_6 dez_unit(tens,tc_dez,zero_dez, carry_out, clk,clearn,tc_sec,loadn,ones_sec);
    // unidades dos minutos -> 0,1,2,3,4,5,6,7,8,9
    Counter_mod_10_min minutes(ones_min,tc_mins,zero_mins,clk,clearn,tc_dez,loadn, carry_out, tens, ones_sec);

    // Lógica de saída do zero e saídas dos contadores, que vão para o decoder
    assign zero = (zero_dez && zero_mins && zero_sec);
    assign sec_ones = ones_sec;
    assign sec_tens = tens;
    assign mins = ones_min;
    
endmodule