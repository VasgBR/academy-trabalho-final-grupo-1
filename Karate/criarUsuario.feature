Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

        Background: Acessar a página de registro de usuário
            Given url baseUrl
            And path "users"

            # @ignore
            Scenario: Cadastrar usuário com sucesso
            * def emailRandom = "elmachips@" + java.util.UUID.randomUUID() + ".com"
            * def payloadCriar = {name: "Elma Chips", email: "#(emailRandom)", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 201
            * def idGerado = response.id
            And match response == "#object"
            And match response contains read("responseBody/criarUsuario/cadastrarUsuarioComSucesso.json")
            * def userEmail = response.email
            * def login = call read("hook.feature@login")
            * def userToken = login.response.session.token
            * def cancelar = call read("hook.feature@cancelar")

            # @ignore
            Scenario: Cadastrar usuário sem nome
            * def emailRandom = "elmachips@" + java.util.UUID.randomUUID() + ".com"
            * def payloadCriar = {name: "", email: "#(emailRandom)", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}

            # @ignore
            Scenario: Cadastrar usuário sem email
            * def payloadCriar = {name: "Elma Chips", email: "", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}

            # @ignore
            Scenario: Cadastrar usuário sem senha
            * def emailRandom = "elmachips@" + java.util.UUID.randomUUID() + ".com"
            * def payloadCriar = {name: "Elma Chips", email: "#(emailRandom)", password: ""}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}
            
            # @ignore
            Scenario: Cadastrar usuário com um email já existente
            * def criar = call read("hook.feature@criar")
            * def userEmail = criar.response.email
            * def payloadCriar = {name: "Elma Chips", email: "#(userEmail)", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 422
            And match response == "#object"
            And match response contains {"error": "User already exists."}

            # @ignore
            Scenario: Cadastrar usuário com formato de email inválido sem arroba
            * def payloadCriar = {name: "Elma Chips", email: "elmachips", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}

            # @ignore
            Scenario: Cadastrar usuário com formato de email inválido sem texto após arroba
            * def payloadCriar = {name: "Elma Chips", email: "elmachips@", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}

            # @ignore
            Scenario: Cadastrar usuário com formato de email inválido sem texto após o ponto
            * def payloadCriar = {name: "Elma Chips", email: "elmachips@teste.", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}

            # @ignore          
            Scenario: Cadastrar usuário com nome contendo 100 caracteres
            * def emailRandom = "elmachips@" + java.util.UUID.randomUUID() + ".com"
            * def payloadCriar = {name: "Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss", email: "#(emailRandom)", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 201
            * def idGerado = response.id
            And match response == "#object"
            And match response contains read("responseBody/criarUsuario/nomeContendo100Caracteres.json")
            * def userEmail = response.email
            * def login = call read("hook.feature@login")
            * def userToken = login.response.session.token
            * def cancelar = call read("hook.feature@cancelar")

            # @ignore
            Scenario: Cadastrar usuário com nome contendo 101 caracteres
            * def emailRandom = "elmachips@" + java.util.UUID.randomUUID() + ".com"
            * def payloadCriar = {name: "Elma Chipssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss", email: "#(emailRandom)", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}

            # @ignore
            Scenario: Cadastrar usuário com email contendo 60 caracteres
            * def emailRandom = "elmachipsssssssssss@" + java.util.UUID.randomUUID() + ".com"
            * def payloadCriar = {name: "Elma Chips", email: "#(emailRandom)", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 201
            * def idGerado = response.id
            And match response == "#object"
            And match response contains read("responseBody/criarUsuario/emailContendo60Caracteres.json")
            * def userEmail = response.email
            * def login = call read("hook.feature@login")
            * def userToken = login.response.session.token
            * def cancelar = call read("hook.feature@cancelar")

            # @ignore
            Scenario: Cadastrar usuário com email contendo 61 caracteres
            * def emailRandom = "elmachipssssssssssss@" + java.util.UUID.randomUUID() + ".com"
            * def payloadCriar = {name: "Elma Chips", email: "#(emailRandom)", password: "Elma1234"}
            And request payloadCriar 
            When method post
            Then status 400
            And match response == "#object"
            And match response contains {"error": "Bad request."}
