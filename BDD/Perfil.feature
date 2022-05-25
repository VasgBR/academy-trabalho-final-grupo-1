Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acesso a pagina do perfil 
        Given que estou logado
        When acesso a pagina perfil

        Scenario: Atualizar nome com sucesso
            And atualizo o nome 
            | nome completo | Elma Chips Queijo |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: Atualizar email com sucesso
            And atualizo o email 
            | email | elmachips@queijo.com |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: Novo e-mail não pode ser existente 
            And insiro um email já cadastrado 
            | e-mail | elmachips@queijo.com |
            Then visualizei a mensagem "Informações atualizadas com sucesso!"
        
        Scenario: Atualizar usuário com nome contendo 100 caracteres
            And preencho os dados do usuário com nome contendo 100 caracteres
            | Nome completo | Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: O campo nome completo não pode ter mais de 100 caracteres
            And digito no campo nome completo 101 caracteres
            | Nome completo | Elma Chipssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            Then visualizo a mensagem "Informe no máximo 100 letras no seu nome"
            
        Scenario: O campo email com mais de 100 caracteres
            And digito no campo email 101 caracteres
            | email | elmachipsssssssssssssssssssssssssssssssssssssssssselmachipssssssssssssssssssssssssssssssssssssssssss@teste.com |
            Then visualizo a mensagem "Informe no máximo 100 letras no seu nome"

        Scenario: O campo email não pode ter mais de 60 caracteres
            And digito no campo email 61 caracteres
            | e-mail | elmachipsssssssssssssssssssssssssssssssssssssssssss@teste.com |  
            Then vizualizo a mensagem "Informações atualizadas com sucesso!"
            
        Scenario: O nome deve conter no mínimo 4 letras
            And digito no campo nome completo 
            | Nome completo | Elm | 
            Then vizualizo a mensagem "Informe seu nome completo"

        Scenario: Inserindo caractere especial no nome
            And digito um caractere especial no campo nome completo
            | Nome completo |  Elm% |
            Then visualizo a manesgem "Formato do nome é inválido."

        Scenario: Inserindo email inválido 
            And digito um email inválido
            | e-mail | elmachips@ |
            Then visualizo a mensagem "Formato de e-mail inválido." 
            
            

    