Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras
 
    Background: Acessar a tela de Histórico
        Given url baseUrl
        And path "list"
        * def criar = call read("hook.feature@criar")
        * def userEmail = criar.response.email
        * def login = call read("hook.feature@login")
        * def userToken = login.response.session.token
    
        # @ignore
        Scenario: Exibe o histórico de listas de compras do usuário
            * def lista = call read("hook.feature@lista")
            And header X-JWT-Token = userToken
            And path "history"
            When method get
            Then status 200
            And match response contains {id: "#string", userId: "#string", description: "#string", active: "#boolean", createdAt: "#string", updatedAt: "#string"}
            * def cancelar = call read("hook.feature@cancelar")

        # @ignore
        Scenario: Exibe o histórico de listas 
            * def lista = call read("hook.feature@lista")
            And pact "history"
            And header X-JWT-Token = userToken
            When method get
            Then status 200
            And match response == "#object"
            * def cancelar = call read("hook.feature@cancelar")