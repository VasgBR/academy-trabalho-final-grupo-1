Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Acessar o site e fazer o login
        Given acessei o site Lembra Compras e estou na página de Lista

        @gestãoCadastro
        @gestãoLogout
        Scenario: Remover um item da lista
            When adiciono um produto na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And clico no símbolo de Lixeira
            Then removo um item da lista

        @gestãoFinalizar
        Scenario: Criar uma lista de compras
            When dou um nome para minha lista
            | nomeLista | Elma Chips Favoritos |
            And adiciono um produto na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And salvo a lista
            Then visualizo a mensagem de sucesso "Lista de compras criada com sucesso!"

        @gestãoFinalizar
        Scenario: Riscar itens na lista
            When salvo a lista com pelo menos um item
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And marco a caixa de seleção do item na lista
            Then o item é riscado

        @gestãoFinalizar
        Scenario: Item continuar riscado após atualizar a página
            When salvo a lista com pelo menos um item
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And marco a caixa de seleção do item na lista
            And atualizo a página
            Then o item continua riscado

        @gestãoLogout
        Scenario: Finalizar a lista
            Given tenho uma lista criada
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And finalizo a lista
            And confirmo a finalização da lista
            Then visualizo a mensagem de sucesso "Lista concluída com sucesso!"

        @gestãoFinalizar
        Scenario: Criar uma lista de compras sem descrição
            And salvo a lista com pelo menos um item
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            Then visualizo a mensagem de sucesso "Lista de compras criada com sucesso!"

        @gestãoLogout
        Scenario: Criar uma lista de compras sem nenhum item
            When dou um nome para minha lista
            | nomeLista | Elma Chips Favoritos |
            And salvo a lista
            Then visualizo a mensagem de erro "Adicione pelo menos um item na sua lista de compras"

        @gestãoLogout
        Scenario: Adicionar item na lista sem informações do produto
            When adiciono um produto na lista sem preencher o campo nome e com quantidade igual a 0
            | nomeProduto |   |
            | quantidade  | 0 |
            Then visualizo as mensagens de erro
            | mensagem1 | Informe o nome do produto    |
            | mensagem2 | Informe pelo menos 1 unidade |

        @gestãoLogout
        Scenario: Adicionar item na lista sem o nome do produto
            When adiciono um produto na lista sem preencher o campo nome
            | nomeProduto |   |
            | quantidade  | 2 |
            Then visualizo a mensagem de erro "Informe o nome do produto"

        @gestãoLogout
        Scenario: Adicionar item na lista com quantidade menor que 1
            When adiciono um produto na lista com quantidade igual a 0
            | nomeProduto | Cebolitos |
            | quantidade  | 0         |
            Then visualizo a mensagem de erro "Informe pelo menos 1 unidade"

        @gestãoFinalizar
        Scenario: Adicionar item na lista com quantidade igual a 1000
            When salvo a lista com pelo menos um item
            | nomeProduto | Cebolitos |
            | quantidade  | 1000      |
            Then visualizo a mensagem de sucesso "Lista de compras criada com sucesso!"

        @gestãoLogout
        Scenario: Adicionar item na lista com quantidade maior que 1000
            When adiciono um produto na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 1001      |
            Then visualizo a mensagem de erro "Informe uma quantidade menor ou igual a 1000"

        @gestãoFinalizar
        Scenario: Aumentar a quantidade dos produtos já adicionados na lista não criada
            When adiciono um produto na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And salvo a lista adicionando o mesmo produto novamente
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            Then o sistema deve somar a quantidade dos produtos adicionados

        @gestãoFinalizar
        Scenario: Aumentar a quantidade dos produtos já adicionados na lista criada
            When salvo pelo menos um item na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And adiciono o mesmo produto na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            Then o sistema deve somar a quantidade dos produtos adicionados

        @gestãoFinalizar
        Scenario: Adicionar um novo produto na lista não criada
            When adiciono um produto na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And salvo a lista adicionando um outro produto na lista
            | nomeProduto | Ruffles |
            | quantidade  | 2       |
            Then o sistema deve me apresentar os dois produtos na lista

        @gestãoFinalizar
        Scenario: Adicionar um novo produto na lista criada
            When salvo a lista com pelo menos um item
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And adiciono outro produto na lista
            | nomeProduto | Ruffles |
            | quantidade  | 2       |
            Then o sistema deve me apresentar os dois produtos na lista
            And visualizo a mensagem de sucesso após adicionar o segundo item "Item adicionado com sucesso!"

        @gestãoLogout
        Scenario: Aumentar a quantidade dos produtos já adicionados na lista não criada para ter uma quantidade maior que 1000
            When adiciono um produto na lista
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And salvo a lista adicionando o mesmo produto novamente
            | nomeProduto | Cebolitos |
            | quantidade  | 999       |
            Then visualizo a mensagem de erro "Não foi possível criar a lista de compras 🥺"

        @gestãoFinalizar
        Scenario: Aumentar a quantidade dos produtos adicionados na lista criada para ter uma quantidade maior que 1000
            When salvo a lista com pelo menos um item
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And adiciono o mesmo produto na lista para ter uma quantidade maior que 1000
            | nomeProduto | Cebolitos |
            | quantidade  | 999       |
            Then visualizo a mensagem de erro "Não é permitido incluir mais de 1000 unidades do produto."

        @gestãoLogout
        Scenario: Cancelar a opção de Finalizar a lista
            Given tenho uma lista criada
            | nomeProduto | Cebolitos |
            | quantidade  | 2         |
            And finalizo a lista
            And cancelo a finalização da lista
            Then volto para a página de Lista