Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Atualizar usuário
        Given url baseUrl 
        And path "users"
        * def criar = call read("hook.feature@criar")
        * def userEmail = criar.response.email 
        * def login = call read("hook.feature@login")
        * def userToken = login.response.session.token
        
        @ignore
        Scenario: Atualizar nome com sucesso
            * def payload = {name: "Elma Chips Queijo", email: "#(userEmail)"} 
            And header X-JWT-Token = userToken  
            And request payload 
            When method put
            Then status 200
            And match response contains {
                id: "#string", 
                name: "Elma Chips Queijo", 
                email: "#(userEmail)", 
                is_admin: "#boolean", 
                createdAt: "#string", 
                updatedAt: "#string"}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Atualizar email com sucesso 
            * def payload = {name: "Elma Chips", email: "#(userEmail)"}
            And header X-JWT-Token = userToken
            And request payload 
            When method put 
            Then status 200
            And match response contains {
                id: "#string", 
                name: "Elma Chips", 
                email: "#(userEmail)",
                is_admin: "#boolean", 
                createdAt: "#string", 
                updatedAt: "#string"} 
            * def cancelar = call read("hook.feature@cancelar")

        #@ignore
        Scenario: Novo e-mail não pode ser existente
            * def criar2 = call read("hook.feature@criar")
            * def userEmail2 = criar2.response.email 
            And header X--JWT-Token = userToken
            And request {name: "Elma Chips", email: "#(userEmail2)"} 
            When method put
            Then status 422
            * def cancelar = call read("hook.feature@cancelar") 
            
        @ignore
        Scenario: Atualizar usuário com nome contendo 100 caracteres
            * def payload = {name: "Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss", email: "#(userEmail)"}
            And header X-JWT-Token = userToken
            And request payload
            When method put 
            Then status 200
            And match response contains {
                id: "#string", 
                name: "Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss", 
                email: "#(userEmail)", 
                is_admin: "#boolean", 
                createdAt: "#string", 
                updatedAt: "#string"}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Atualizar usuário com email contendo 60 caracteres
            * def payload = {name: "Elma Chips", email: "elmachipssssssssssssssssssssssssssssssssssssssssss@teste.com"}
            And header X-JWT-Token = userToken
            And request payload
            When method put 
            Then status 200
            And match response contains {
                id: "#string", 
                name: "Elma Chips", 
                email: "elmachipssssssssssssssssssssssssssssssssssssssssss@teste.com", 
                is_admin: "#boolean", 
                createdAt: "#string", 
                updatedAt: "#string"}
            * def cancelar = call read("hook.feature@cancelar")     

        @ignore
        Scenario: Atualizar usuário com nome contendo 101 caracteres
            * def payload = {name: "Elma Chipssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss", email: "#(userEmail)"}
            And header X-JWT-Token = userToken
            And request payload
            When method put
            Then status 400
            And match response contains {error: "Bad request."}
            * def cancelar = call read("hook.feature@cancelar")

        @ignore 
        Scenario: Atualizar usuário com email contendo 61 caracteres
            * def payload = {name: "Elma Chips", email: "elmachipsssssssssssssssssssssssssssssssssssssssssss@teste.com"}
            And header X-JWT-Token = userToken 
            And request payload 
            When method put 
            Then status 400
            And match response contains {error: "Bad request."}
            * def cancelar = call read("hook.feature@cancelar")
 
        # Scenario: O nome deve conter no mínimo 4 letras
        #     * def payload = {name: "Elm", email: "#(userEmail)"}
        #     And header X-JWt-Token = userToken
        #     And request payload
        #     When method put 
        #     Then status 400
        #     And match response contains {error: "Bad request."}
        #     * def cancelar = call read("hook.feature@cancelar")

        # Scenario: Inserindo caractere especial no nome
        #     * def payload = {name: "Elm%", email: "#(userEmail)"}
        #     And header X-JWT-Token = userToken
        #     And request payload 
        #     When method put
        #     Then status 400
        #     And match response contains {error: "Bad request."}
        #     * def cancelar = call read("hook.feature@cancelar")

        @ignore
        Scenario: Inserindo email inválido 
            * def payload = {name: "Elma Chips", email: "elmachips@"}
            And header X-JWT-Token = userToken
            And request payload
            When method put
            Then status 400
            And match response contains {error: "Bad request."}



        




