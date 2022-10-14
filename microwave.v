module microwave(input wire startn, clearn, stopn, door_closed, clock,
    input wire [9:0] keypad,
    output wire [6:0] sec_ones_segs, sec_tens_segs, min_segs,
    output wire mag_on);

    // Fios internos que conectam o encoder ao timer, o magnetron ao encoder e ao timer e o timer ao
    // decoder
    wire [3:0] D_to_data, timer_decoder_sec, timer_decoder_tens, timer_decoder_mins;
    wire zero_to_timer_done, loadn_to_loadn, pgt_to_clock, magnetron;

    // Configurando o magnetron
    controle_magnetron controller(startn, stopn, clearn, door_closed, zero_to_timer_done, mag_on);
    // Configurando o encoder
    encoder enc(D_to_data, loadn_to_loadn, pgt_to_clock, keypad, mag_on, clock);
    // Configurando o timer
    timer timer(timer_decoder_sec, timer_decoder_tens, timer_decoder_mins, zero_to_timer_done, pgt_to_clock, clearn, mag_on, loadn_to_loadn, D_to_data);
    // Configurando o decoder
    decoder_7 dec(sec_ones_segs, sec_tens_segs, min_segs, timer_decoder_sec, timer_decoder_tens, timer_decoder_mins); 


endmodule