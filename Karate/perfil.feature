Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Atualizar usuário
        Given url baseUrl 
        And path "users"
        
        Scenario: Atualizar nome com sucesso
            And header X-JWT-Token = logar.response.token 
            And request (nome: "Elma Chips") 
            When method put
            Then status 200
            And match response contains () 
