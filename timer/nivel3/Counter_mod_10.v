module Counter_mod_10(output reg [3:0] ones, 
                      output wire tc,zero, 
                      input wire clk, clearn, EN, loadn,
                      input wire [3:0] data);

  // Registradores para que seja possível realizar a atribuição, que é feita de forma sequencial
  // dentro do bloco always
  // O zero só pode ser 1 quando o estado atual desse contador é 0, ou seja, quando ele tiver
  // chegado em 0
  assign zero = (ones == 0) ? 1 : 0;
  // O tc só pode ser 1 quando o contador tiver chegado a 0 e o enable for 1
  assign tc = ((ones == 0)& EN) ? 1 : 0;

  always @(posedge clk, negedge clearn)
    begin
		if (!clearn) begin
			ones <= 4'b0000;
		end
		else if (!loadn) begin
			ones <= data;
		end
		else if (EN) begin
			if (ones == 4'b0000) begin
				// Se o contador chegar a zero, reinicia a contagem
				ones <= 4'b1001;
			end
			else begin
				// Se o contador ainda não for 0, diminui em 1 unidade
				ones <= ones - 1;
			end
		end
    end
  // O próximo always verifica o clear de forma assíncrona, para zerar o contador caso a tecla seja
  // apertada
endmodule