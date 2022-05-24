Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras
    
        Background: Acessar o site e fazer o login
        Given acesso o site Lembra Compras
        And faço login no site
        | email | ari@ana.com|
        | senha | 123        |
        And já possuo alguma lista já criada no site

        Scenario: Visualizar histórico de listas de compras
            When clico em Histórico
            And visualizo o histórico de listas cadastradas por mim
        
        Scenario: Visualizar as 10 últimas listas de compras cadastradas
            When clico em histórico
            And visualizo o nome e data de criação das listas
            Then o sistema deve mostrar apenas as 10 últimas listas cadastradas
            
        Scenario: Visualizar itens de uma lista de compra
            When clico em histórico
            And clico em uma das listas cadastradas
            Then o sistema deve mostrar todos os itens e quantidades dos produtos cadastrados na lista de compras
            
            

            
            
            
           

