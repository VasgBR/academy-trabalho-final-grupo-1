Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Acessar a tela de Lista
        Given url baseUrl
        And path "list"
        * def criar = call read("hook.feature@criar")
        * def userEmail = criar.response.email
        * def login = call read("hook.feature@login")
        * def userToken = login.response.session.token

        @ignore
        Scenario: Criar lista de compras com sucesso
            * def payload = { description: "Compras para a ceia de natal", items: [{name: "Arroz pct 1kg", amount: 2}]}
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 201
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Criar lista de compras sem descrição
            * def payload = { description: "", items: [{name: "Arroz pct 1kg", amount: 2}]}
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 201
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Criar lista de compras sem nenhum item
            * def payload = {description: "", items: [{name: "", amount: 0}]}
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 400
            And match response contains {error: "Bad request."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Criar lista de compras sem nome do produto
            * def payload = {description: "", items: [{name: "", amount: 2}]}
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 400
            And match response contains {error: "Bad request."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Criar lista de compras com quantidade negativa de itens
            * def payload = {description: "", items: [{name: "Arroz pct 1kg", amount: -2}]}
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 400
            And match response contains {error: "Bad request."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Criar lista de compras com quantidade igual a 1000
            * def payload = {description: "", items: [{name: "Arroz pct 1kg", amount: 1000}]}
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 201
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Criar lista de compras com quantidade acima de 1000
            * def payload = {description: "", items: [{name: "Arroz pct 1kg", amount: 1001}]}
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 400
            And match response contains {error: "Bad request."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Criar lista de compras com credenciais inválidas
            * def payload = { description: "Compras para a ceia de natal", items: [{name: "Arroz pct 1kg", amount: 2}]}
            And header X-JWT-Token = userToken + "0"
            And request payload
            When method post
            Then status 401
            And match response contains {status: 401, message: "Invalid token."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Retorna a lista atualmente ativa quando não existe lista criada
            And header X-JWT-Token = userToken
            When method get
            Then status 200
            And match response == "#array"
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Retorna a lista atualmente ativa quando existe lista criada
            * def lista = call read("hook.feature@lista")
            And header X-JWT-Token = userToken
            When method get
            Then status 200
            And match response contains { description: "#string", items: [{id: "#string", listId: "#string", name: "#string", amount: "#number", createdAt: "#string", updatedAt: "#string"}]}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Retorna a lista atualmente ativa com credenciais inválidas
            And header X-JWT-Token = userToken + "0"
            When method get
            Then status 401
            And match response contains {status: 401, message: "Invalid token."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Adicionar novo item na lista já criada
            * def payload = { name: "Feijão", amount: 2}
            * def lista = call read("hook.feature@lista")
            And path "item"
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 201
            * def listaRetorna = call read("hook.feature@listaRetorna")
            And match listaRetorna.response contains { description: "#string", items: [{id: "#string", listId: "#string", name: "Arroz pct 1kg", amount: 2, createdAt: "#string", updatedAt: "#string"}, {id: "#string", listId: "#string", name: "Feijão", amount: 2, createdAt: "#string", updatedAt: "#string"}]}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Aumentar a quantidade dos produtos já criados na lista
            * def payload = { name: "Arroz pct 1kg", amount: 4}
            * def lista = call read("hook.feature@lista")
            And path "item"
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 201
            * def listaRetorna = call read("hook.feature@listaRetorna")
            And match listaRetorna.response contains { description: "#string", items: [{id: "#string", listId: "#string", name: "Arroz pct 1kg", amount: 6, createdAt: "#string", updatedAt: "#string"}]}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Aumentar a quantidade dos produtos já criados na lista para ter uma quantidade maior que 1000
            * def payload = { name: "Arroz pct 1kg", amount: 999}
            * def lista = call read("hook.feature@lista")
            And path "item"
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 422
            And match response contains { error: "Max item amount is 1000."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Adicionar novo item na lista não criada
            * def payload = { name: "Arroz pct 1kg", amount: 2}
            And path "item"
            And header X-JWT-Token = userToken
            And request payload
            When method post
            Then status 422
            And match response contains { error: "There is no active list."}

        @ignore
        Scenario: Adicionar novo item na lista já criada com credenciais inválidas
            * def payload = { name: "arroz pct 1kg", amount: 2}
            * def lista = call read("hook.feature@lista")
            And path "item"
            And header X-JWT-Token = userToken + "0"
            And request payload
            When method post
            Then status 401
            And match response contains {status: 401, message: "Invalid token."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Desativar lista com sucesso
            * def lista = call read("hook.feature@lista")
            And header X-JWT-Token = userToken
            When method patch
            Then status 204
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Desativar lista com credenciais inválidas
            * def lista = call read("hook.feature@lista")
            And header X-JWT-Token = userToken + "0"
            When method patch
            Then status 401
            And match response contains { status: 401, message: "Invalid token."}
            * def cancelar = call read("hook.feature@cancelar")