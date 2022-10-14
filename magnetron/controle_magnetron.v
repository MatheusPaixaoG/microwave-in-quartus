module controle_magnetron (
    input wire startn , stopn , clearn, door_closed, timer_done, 
    output wire mag_on
); 
    wire R, S; // Fios internos que representam as entradas R e S do latch
    // Passando os inputs e outputs para o bloco lógico do magnetron
    logica_mag logica(startn, stopn, clearn, door_closed, timer_done, S, R);
    // Passando os inputs e outputs para o latch_SR
    latch_SR latch(S, R, mag_on);  
    
endmodule