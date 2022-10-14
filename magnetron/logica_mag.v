module logica_mag (
    input wire startn , stopn , clearn, door_closed, timer_done, 
    output reg  S, R
);

    always @(startn, stopn, clearn, door_closed, timer_done) begin
        // Só entra no if se clearn for 0, stopn for 0, timer_done for 1 ou door_closed for 1
        if(!clearn || !stopn || timer_done || !door_closed) 
            begin
                S = 0; // Nesse estado, o magnetron deverá ser desligado, por isso as entradas do 
                R = 1; // latch serão 0 para o S e 1 para o R
            end
        else if(!startn && door_closed) // Só entra nesse bloco se não entrar no primeiro e quando
            begin                       // o botão de start tiver sido clicado e a porta estiver fechada
                S = 1;  // Nesse estado, o magnetron deverá ser ligado, por isso as entradas do 
                R = 0;  // latch serão 1 para S e 0 para R
            end
    end
endmodule