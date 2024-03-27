def retirar_estoque(produtos)
  limpar_tela

  mensagem_amarelo("==========Escolha um dos produtos abaixo==========", false, false)

  table = Terminal::Table.new do |t|
    t.headings = %w[ID Nome Quantidade]
    produtos.each do |row|
      t.add_row [row[:id], row[:nome], row[:quantidade]]
    end
  end

  puts table  # Agora você está usando a variável table aqui

  mensagem_azul("Digite o ID do produto:", false, false)
  id = gets.to_i
  produto = produtos.find{|p| p[:id] == id}
  unless produto
    mensagem_vermelho("Produto do ID (#{id}) não encontrado na lista", false, false, 2)
    mensagem_amarelo("Deseja digitar novamente? (s/n)", false, false, 2)
    opcao = gets.chomp.downcase
    limpar_tela
    if opcao == "s" || opcao == "sim"
      retirar_estoque(produtos)
    end

    return
  end

  limpar_tela
  mensagem_azul("Digite a quantidade que deseja retirar do estoque do produto #{amarelo(produto[:nome])}:", false, false)
  quantidade_retirada = gets.to_i
  produto[:quantidade] = produto[:quantidade] - quantidade_retirada
  mensagem_verde("Retirada realizada com sucesso", true, true, 2)
  listar_produtos(produtos)
end
