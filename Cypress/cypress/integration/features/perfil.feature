Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acesso a pagina do perfil 
        Given que acessei o site Lembra Compras 
        And na página Perfil

        Scenario: Atualizar nome com sucesso
            When atualizo o nome 
            | nome completo | Elma Chips Queijo |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: Atualizar email com sucesso
            When atualizo o email 
            | email | elmachips@queijo.com |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: Novo e-mail não pode ser existente 
            When insiro um email já cadastrado 
            | e-mail | elmachips@queijo.com |
            Then visualizo a mensagem "Este e-mail já é utilizado por outro usuário."
        
        Scenario: Atualizar usuário com nome contendo 100 caracteres
            When atualizo o nome do usuário para conter 100 caracteres
            | Nome completo | Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: Atualizar usuário com nome contendo 101 caracteres
            When atualizo o nome do usuário para conter 101 caracteres
            | Nome completo | Elma Chipssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            Then visualizo a mensagem "Informe no máximo 100 letras no seu nome"
            
        Scenario: Atualizar usuário com email contendo 60 caracteres
            When atualizo o email do usuário para conter 60 caracteres 
            | email | elmachipssssssssssssssssssssssssssssssssssssssssss@teste.com |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: Atualizar usuário com email contendo 61 caracteres
            When atualizo o email do usuário para conter 61 caracteres
            | email | elmachipsssssssssssssssssssssssssssssssssssssssssss@teste.com |  
            Then vizualizo a mensagem "Informe no máximo 60 letras no seu email"
            
        Scenario: O nome deve conter no mínimo 4 letras
            When atualizo o campo nome completo para ter menos de 4 letras  
            | Nome completo | Elm | 
            Then vizualizo a mensagem "Informe seu nome completo"

        Scenario: Inserindo caractere especial no nome
            When atualizo o campo nome completo com caractere especial 
            | Nome completo |  Elm% |
            Then visualizo a mensagem "Formato do nome é inválido."

        Scenario: Inserindo email inválido 
            When atualizo um email inválido
            | email | elmachips@ |
            Then visualizo a mensagem "Formato de email inválido." 