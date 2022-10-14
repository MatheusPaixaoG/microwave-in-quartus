module Counter_mod_6(output reg [3:0] tens, 
                      output wire tc,zero, carry_out, 
                      input wire clk, clearn, EN, loadn,
                      input wire [3:0] data);

    // Registradores para que seja possível realizar a atribuição, que é feita de forma sequencial
    // dentro do bloco always
    reg [3:0] current_state;
    // O carry_out serve para indicar ao contador dos minutos que é necessário adicionar 1 unidade
    // para que o resultado mostrado no visor seja o certo
    reg carry_out_reg;
    assign carry_out = carry_out_reg;

    // O zero só pode ser 1 quando o estado atual desse contador é 0, ou seja, quando ele tiver
    // chegado em 0
    assign zero = (tens == 0) ? 1 : 0;
    // O tc só pode ser 1 quando o contador tiver chegado a 0 e o enable for 1
    assign tc = ((tens == 0) & EN) ? 1 : 0;

    always @(posedge clk, negedge clearn)
    begin
		if (!clearn) begin
			tens <= 4'b0000;
		end
		else if (!loadn) begin
			// O contador verificar se a entrada é maior que 6 quando ele vai receber os 
         // dados pela primeira vez
         if (data > 4'b0101) begin
				// Se os dados vindos do contador de segundos forem maiores que 5, então é
            // preciso mudá-los e configurar o carry_out para 1
            tens <= data - 6;
            carry_out_reg <= 1;
         end
         else begin
            // Se não, ocorre o fluxo normal do contador
            tens <= data;
            carry_out_reg <= 0;
         end
		end
      else if (EN) begin
			if (tens == 4'b0000) begin
				tens <= 4'd5;
         end
         else begin
            tens <= tens - 1;
         end
      end
    end

endmodule