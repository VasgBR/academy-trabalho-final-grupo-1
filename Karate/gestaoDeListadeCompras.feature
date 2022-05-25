Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: 
        Given url baseUrl
        And path "list"

        @ignore
        Scenario: Retorna a lista atualmente ativa com sucesso
        * def criar = call read("hook.feature@criar")
        * def userEmail = criar.response.email
        * def login = call read("hook.feature@login")
        * def userToken = login.response.session.token
        And header X-JWT-Token = userToken
        When method get
        Then status 200
        And match response == "#array"
        * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Retorna a lista atualmente ativa com credenciais inválidas
        * def criar = call read("hook.feature@criar")
        * def login = call read("hook.feature@login")
        * def userToken = login.response.session.token
        And header X-JWT-Token = null
        When method get
        Then status 401
        And match response contains {status: 401, message: "Required X-JWT-Token header not found."}
        * def cancelar = call read("hook.feature@cancelar")