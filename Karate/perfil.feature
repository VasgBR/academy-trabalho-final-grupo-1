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
            And match response contains {id: "#string", name: "Elma Chips Queijo", email: "#(userEmail)", is_admin: "#boolean", createdAt: "#string", updatedAt: "#string"}
            * def cancelar = call read("hook.feature@cancelar")

        Scenario: Atualizar email com sucesso 
            * def payload = {name: "Elma Chips", email: "#(userEmail)"}
            And header X-JWT-Token = userToken
            And request payload 
            When method put 
            Then status 200
            And match response contains {id: "#string", name: "Elma Chips", email: "#(userEmail)", is_admin: "#boolean", createdAt: "#string", updatedAt: "#string"} 
