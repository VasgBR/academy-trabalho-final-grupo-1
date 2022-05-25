Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras
    
        Background: Acessar o site e fazer o login
        Given que acessei o site Lembra Compras
        And faço login no site com os dados já cadastrados
        |    nomeUsuario     |     Elma Chips      |
        |    senhaUsuario    |      Elma1234       |
        And já possuo alguma lista já criada no site

        Scenario: Visualizar o histórico das 10 últimas listas de compras cadastradas por mim
            When clico em Histórico
            And visualizo o nome e data de criação das listas
            Then o sistema deve mostrar apenas as 10 últimas listas cadastradas
            
        Scenario: Visualizar itens de uma lista de compra
            When clico em histórico
            And clico em uma das listas cadastradas
            Then o sistema deve mostrar todos os itens e quantidades dos produtos cadastrados na lista de compras
            
        Scenario: Clicar no nome da página
            When clico em Lembra Compras
            Then sou direcionado para a aba de lista

        Scenario: Clicar no ícone no caonto superior esquerdo R
            When clico no ícone principal
            Then sou direcionado para a aba de lista

            
            
            
           

