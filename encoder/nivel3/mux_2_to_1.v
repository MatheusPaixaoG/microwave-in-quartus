module mux_2_to_1(output wire pgt_1Hz,
                input wire atraso,  Hz_1 , Sel);

assign pgt_1Hz = (Sel == 1'b0) ? atraso :
                 (Sel == 1'b1) ?  Hz_1 :
                 1'bX;

endmodule
