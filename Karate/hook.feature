@ignore

Feature: Hooks
    Como um desenvolvedor dos testes no Karate
    Desejo criar hooks
    Para automatizar todos os testes

    @criar
    Scenario: Criar usuário
    * def emailRandom = "elmachips@" + java.util.UUID.randomUUID() + ".com"
    * def payloadCriar = {name: "Elma Chips", email: "#(emailRandom)", password: "Elma1234"}
     Given url baseUrl
    And path "users"
    And request payloadCriar
    When method post
    Then status 201

    @login
    Scenario: Login
    Given url baseUrl
    And path "auth", "login"
    And form field email = userEmail
    And form field password = "Elma1234"
    When method post
    Then status 200

    @cancelar
    Scenario: Cancelar conta
    Given url baseUrl
    And path "cancel-account"
    And header X-JWT-Token = userToken
    When method delete
    Then status 204
