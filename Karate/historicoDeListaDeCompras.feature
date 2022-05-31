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
       
        # @ignore
        Scenario: Exibe o histórico de listas de compras do usuário
            Given header X-JWT-Token = userToken
            And path "history"
            * def lista1 = call read("hook.feature@lista")
            * def listaInativa1 = call read("hook.feature@listaInativa")
            * def lista2 = call read("hook.feature@lista")
            * def listaInativa2 = call read("hook.feature@listaInativa")
            When method get
            Then status 200
            And match response contains read("responseBody/historicoDeListaDeCompras/exibeOHistorico.json")
            And match response == "#array"
            * def cancelar = call read("hook.feature@cancelar")

        # @ignore
        Scenario: Histórico de listas com Credenciais Inválidas
            Given header X-JWT-Token = "0"
            And path "history"
            When method get
            Then status 401
            And match response contains {status: 401, message: "Invalid token."}
            And match response == "#object"
            * def cancelar = call read("hook.feature@cancelar")
        
        # @ignore
        Scenario: Exibe itens das listas de compras inativa do usuário
            Given path "history"
            And header X-JWT-Token = userToken
            And path idList
            When method get
            Then status 200
            And match response contains read("responseBody/historicoDeListaDeCompras/exibeItensDasListas.json")
            And match response == "#array"
            * def cancelar = call read("hook.feature@cancelar")

        # @ignore
        Scenario: Encontrar lista inativa com Credenciais Inválidas
            Given path "history"
            And header X-JWT-Token = userToken + "0"
            And path idList
            When method get
            Then status 401
            And match response contains {status: 401, message: "Invalid token."}
            And match response == "#object"
            * def cancelar = call read("hook.feature@cancelar")

        # @ignore
        Scenario: Lista não criada
            Given path "history"
            And header X-JWT-Token = userToken
            And path "3fa85f64-5717-4562-b3fc-2c963f66afa6"
            When method get
            Then status 404
            And match response contains {error: "List not found."}
            And match response == "#object"
            * def cancelar = call read("hook.feature@cancelar")