Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras
    
        Background: Acessei o site e fiz o login
            Given que acessei o site Lembra Compras 
            And tenho listas cadastradas
            And acessei a página histórico

            Scenario: Visualizar o histórico das 10 últimas listas de compras cadastradas por mim
                Then o sistema deve mostrar o nome e a data de criação apenas das 10 últimas listas cadastradas
                            
            Scenario: Visualizar itens de uma lista de compra
                When clico em uma das listas cadastradas
                Then o sistema mostra todos os itens e quantidades dos produtos cadastrados na lista de compras

            
            
            
           

