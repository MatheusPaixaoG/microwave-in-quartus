module Counter_mod_10_min(output reg [3:0] ones, 
                      output wire tc,zero, 
                      input wire clk, clearn, EN, loadn, carry_out,
                      input wire [3:0] data, ones_sec);
  // Registradores para que seja possível realizar a atribuição, que é feita de forma sequencial
  // dentro do bloco always
  reg [3:0] current_state;
  // O carry_out serve para indicar ao contador dos minutos que é necessário adicionar 1 unidade
  // para que o resultado mostrado no visor seja o certo
  assign zero = (ones == 0) ? 1 : 0;
  assign tc = ((ones == 0)& EN) ? 1 : 0;

  // O próximo always verifica a borda de subida do clock e tanto a borda de subida quanto a de 
  // descida do carry_out, para saber quando ele se torna 1 e quando ele se torna 0, para que 
  // seja possível configurar o valor inicial do contador dos minutos de forma correta
  always @(posedge clk, negedge clearn)
    begin
		if (!clearn) begin
			ones <= 4'b0000;
		end
      else if (!loadn) begin
			if (carry_out == 1)
				// Se o carry_out for 1, ele precisa adicionar 1 aos dados
				ones <= data + 1;
			else
				// Se o carry_out for 0, ele não adiciona 1 aos dados
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
endmodule