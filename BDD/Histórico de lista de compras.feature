Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras
    
        Background: Acessar o site e fazer o login
        Given acesso o site Lembra Compras
        And faço login no site
        | email | ari@ana.com|
        | senha | 123        |
        And possuo alguma lista já criada no site

        Scenario: Visualizar histórico de listas de compras
            When clico em Histórico
            And visualizo o histórico de listas cadastras
           

