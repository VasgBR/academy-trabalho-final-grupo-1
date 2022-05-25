Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: 
        Given url baseUrl
        And path "list"

        Scenario: Retorna a lista atualmente ativa
        * def criar = call read("hook.feature@criar")
        * def login = call read("hook.feature@login")
        * def userToken = login.response.session.token
        And header X-JWT-Token = userToken
        When method get
        Then status 200
        * def cancelar = call read("hook.feature@cancelar")

        