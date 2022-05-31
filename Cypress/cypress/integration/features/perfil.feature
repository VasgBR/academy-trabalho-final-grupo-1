Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acesso a pagina do perfil 
        Given que acessei o site Lembra Compras 
        And na página Perfil

        @perfil
        Scenario: Atualizar nome com sucesso
            When atualizo o nome 
            | nomeCompleto | Elma Chips Queijo |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"
       
        @perfil
        Scenario: Atualizar email com sucesso
            When atualizo o email 
            | email | elmachips@queijo.com |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        @perfil
        Scenario: Novo e-mail não pode ser existente 
            When insiro um email já cadastrado 
            | email | elmachips@presunto.com |
            Then visualizo a mensagem "Este e-mail já é utilizado por outro usuário."
        
        @perfil
        Scenario: Atualizar usuário com nome contendo 100 caracteres
            When atualizo o nome do usuário para conter 100 caracteres
            | nomeCompleto | Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        @perfil
        Scenario: Atualizar usuário com nome contendo 101 caracteres
            When atualizo o nome do usuário para conter 101 caracteres
            | nomeCompleto | Elma Chipssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            Then visualizo a mensagem "Informe no máximo 100 letras no seu nome"
        
        @perfil   
        Scenario: Atualizar usuário com email contendo 60 caracteres
            When atualizo o email do usuário para conter 60 caracteres 
            | email | elmachipssssssssssssssssssssssssssssssssssssssssss@presunto.com |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        @perfil
        Scenario: Atualizar usuário com email contendo 61 caracteres
            When atualizo o email do usuário para conter 61 caracteres
            | email | elmachipsssssssssssssssssssssssssssssssssssssssssss@presunto.com |  
            Then visualizo a mensagem "Informe no máximo 60 letras no seu email"
        
        @perfil    
        Scenario: Atualizar usuário com email contendo 101 caracteres
            When atualizo o email do usuário para conter 101 caracteres
            | email | elmachipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss@presunto.com |  
            Then visualizo a mensagem "Informe no máximo 100 caracteres."
        
        @perfil
        Scenario: O nome deve conter no mínimo 4 letras
            When atualizo o campo nome completo para ter menos de 4 letras  
            | nomeCompleto | Elm | 
            Then visualizo a mensagem "Informe seu nome completo"
        
        @perfil
        Scenario: Inserindo caractere especial no nome
            When atualizo o campo nome completo com caractere especial 
            | nomeCompleto |  Elm% |
            Then visualizo a mensagem "Formato do nome é inválido."
        
        @perfil
        Scenario: Inserindo email inválido 
            When atualizo um email inválido
            | email | elmachips@ |
            Then visualizo a mensagem "Formato de e-mail inválido." 
        