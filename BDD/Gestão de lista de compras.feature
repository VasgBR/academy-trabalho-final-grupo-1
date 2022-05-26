Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Acessar o site e fazer o login
        Given acessei o site Lembra Compras e estou na página de Lista

        Scenario: Remover um item da lista
            When adiciono um produto na lista
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 2 |
            And clico no símbolo de Lixeira
            Then removo um item da lista

        Scenario: Criar uma lista de compras
            When dou um nome para minha lista
            | nomeLista | Compras para a ceia de natal |
            And adiciono um produto na lista
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 2 |
            And salvo a lista
            Then visualizo a mensagem de sucesso "Lista de compras criada com sucesso!"

        Scenario: Riscar itens na lista
            When salvo a lista com pelo menos um item
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 2 |
            And marco a caixa de seleção do item na lista
            Then o item é riscado

        Scenario: Finalizar a lista
            When salvo a lista com pelo menos um item
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 2 |
            And finalizo a lista
            And confirmo a finalização da lista
            Then visualizo a mensagem de sucesso "Lista concluída com sucesso!"

        Scenario: Criar uma lista de compras sem descrição
            And salvo a lista com pelo menos um item
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 2 |
            Then visualizo a mensagem de sucesso "Lista de compras criada com sucesso!"

        Scenario: Criar uma lista de compras sem nenhum item
            When dou um nome para minha lista
            | nomeLista | Compras para a ceia de natal |
            And salvo a lista
            Then visualizo a mensagem de erro "Adicione pelo menos um item na sua lista de compras"

        Scenario: Adicionar item na lista com quantidade menor que 1
            When adiciono um produto na lista
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 0 |
            Then visualizo a mensagem de erro "Informe pelo menos 1 unidade"

        Scenario: Adicionar item na lista com quantidade igual a 1000
            When adiciono um produto na lista
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 1000 |
            Then visualizo a mensagem de erro "Lista de compras criada com sucesso!"

        Scenario: Adicionar item na lista com quantidade maior que 1000
            When adiciono um produto na lista
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 1001 |
            Then visualizo a mensagem de erro "Informe uma quantidade menor ou igual a 1000"

        Scenario: Aumentar a quantidade dos produtos já adicionados na lista
            When adiciono um produto na lista
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 1 |
            And adiciono o mesmo produto novamente
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 1 |
            Then o sistema deve aumentar a quantidade do produto listado

        Scenario: Aumentar a quantidade dos produtos já adicionados na lista para ter uma quantidade maior que 1000
            When adiciono um produto na lista
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 1000 |
            And adiciono o mesmo produto novamente
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 1 |
            Then visualizo a mensagem de erro "Não é permitido incluir mais de 1000 unidades do produto."

        Scenario: Cancelar a opção de Finalizar a lista
            When salvo a lista com pelo menos um item
            | nomeProduto | Arroz pct 1kg |
            | quantidade | 2 |
            And finalizo a lista
            And cancelo a finalização da lista
            Then volto para a página de Lista

        Scenario: Clicar no nome da página
            Given não estou na aba de lista
            When clico no Lembra Compras
            Then sou direcionado para a aba de Lista

        Scenario: Clicar no ícone principal que é um R
            Given não estou na aba de lista
            When clico no ícone principal
            Then sou direcionado para a aba de Lista