Feature: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras.

Background: acesso à página de login
    Given url baseUrl
    And path "/auth/login"
    * def criar = call read("hook.feature@criar")
    * def userEmail = criar.response.email

    # @ignore
    Scenario: login com sucesso
    * def payloadLogin = {email: "#(userEmail)", password: "Elma1234"}
    And request payloadLogin
    When method post
    Then status 200
    And match response contains {"auth": true, "session": {"token": "#string", "issued": "#number", "expires": "#number"}}
    
    # @ignore
    Scenario: login com e-mail não cadastrado
    * def payloadLogin = {email: "elmaelma@teste.com", password: "Elma1234"}
    And request payloadLogin
    When method post
    Then status 403
    And match response contains {"error": "Invalid email or password."}

    # @ignore
    Scenario: login com senha não cadastrada
    * def payloadLogin = {email: "#(userEmail)", password: "1234Elma"}
    And request payloadLogin
    When method post
    Then status 403
    And match response contains {"error": "Invalid email or password."}

    # @ignore
    Scenario: login sem e-mail
    * def payloadLogin = {email: "", password: "Elma1234"}
    And request payloadLogin
    When method post
    Then status 400
    And match response contains {"error": "Bad request."}

    # @ignore
    Scenario: login sem senha
    * def payloadLogin = {email: "#(userEmail)", password: ""}
    And request payloadLogin
    When method post
    Then status 400
    And match response contains {"error": "Bad request."}

    # @ignore
    Scenario: login sem e-mail e senha
    * def payloadLogin = {email: "", password: ""}
    And request payloadLogin
    When method post
    Then status 400
    And match response contains {"error": "Bad request."}