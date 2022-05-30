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
        * def lista = call read("hook.feature@lista")
        * def listaRetorna = call read("hook.feature@listaRetorna")
        * def idList = listaRetorna.response.items[0].idList
        * def listaInativa = call read("hook.feature@listaInativa")
       
        @ignore
        Scenario: Exibe o histórico de listas de compras do usuário
            And header X-JWT-Token = userToken
            And path "history"
            * def lista1 = call read("hook.feature@lista")
            * def listaInativa1 = call read("hook.feature@listaInativa")
            * def lista2 = call read("hook.feature@lista")
            * def listaInativa2= call read("hook.feature@listaInativa")
            When method get
            Then status 200
            And match response contains {id: "#string", userId: "#string", description: "#string", active: "#boolean", createdAt: "#string", updatedAt: "#string"}
            * def cancelar = call read("hook.feature@cancelar")

        # @ignore
        Scenario: Exibe o histórico de no máximo 10 listas de compras do usuário
            And header X-JWT-Token = userToken
            And path "history"
            When method get
            Then status 200
            And match response contains {id: "#string", userId: "#string", description: "#string", active: "#boolean", createdAt: "#string", updatedAt: "#string"}
            * def cancelar = call read("hook.feature@cancelar")


        # @ignore
        Scenario: Usuário com token diferente
            And header X-JWT-Token = "0"
            And path "history"
            When method get
            Then status 401
            And match response contains {message: "Invalid token."}
            * def cancelar = call read("hook.feature@cancelar")
        
       @ignore
        Scenario: Exibe itens da listas de compras inativa do usuário
            And path "history"
            And header X-JWT-Token = userToken
            And path idList
            When method get
            Then status 200
            And match response contains {id: "#string", listId: "#string", name: "#string", amount: "#number", createdAt: "#string", updatedAt: "#string"}
            And match response == "#object"
            * def cancelar = call read("hook.feature@cancelar")



            