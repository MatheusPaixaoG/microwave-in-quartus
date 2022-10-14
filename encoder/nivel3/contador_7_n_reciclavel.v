module contador_7_n_reciclavel( 
    input wire Clock, Clear,
    output reg saida);

    reg [2:0] contador = 0;
/*
Como clear é ativo em nível alto, é preciso verificar também quando sua borda positiva chega,
além de ser necessário verificar o contador toda vez que a borda positiva do clock chega.
O contador recebe como entrada o clock e o clear, que vem do codificador e é ativado quando 
alguém tecla algum dígito.

Além disso, ele dá um atraso de 40 ms para evitar trepidação quando alguém clicar em alguma tecla.
Esse valor de 40 ms para tornar a saída positiva é dado na verificação "if(contador == 3)". Aqui,
é verificado se contador é igual a 3 porque ele está em um bloco sequencial, então contador será
incrementado para 4 na execução em que contador=3. 
*/ 
    always @(posedge Clock or posedge Clear) 
    begin
        if(Clear) begin
            saida <= 0;
            contador <= 0; // era contador = 0;
        end
        else begin
            if(contador < 7) 
                contador <= contador + 1;
            if(contador == 3) 
                saida <=  1;
            else 
                saida <= 0;
        end
    end
endmodule
