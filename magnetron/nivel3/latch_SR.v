module latch_SR(input wire S,R, 
output reg Q);

/*
Comportamento normal de um latch SR, que mantém o valor quando S e R são 0, tem a saída Q como 
0 quando S é 0 e R é 1, Q será 1 quando S é 1 e R é 0 e será um "don't care" quando S e R são 1
*/

always@ (S,R)
begin
    if(S==0 && R==0)
        Q <= Q;
    else if (S==0 && R==1)
        Q <= 0; 
    else if (S==1 && R==0) 
        Q <= 1; 
    else if (S==1 && R==1) 
        Q <= 1'bX;
   
end

endmodule