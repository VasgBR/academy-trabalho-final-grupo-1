Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: acesso a pagina do perfil 
        Given que estou logado
        When vou em perfil

        Scenario: atualizar perfil
            And atualizo o e-mail
            Then visualizo a mensagem "Informações atualizadas com sucesso!"

        Scenario: não pode atualizar os campos identificador e tipo de conta 
            And alterar o identificador ou tipo de conta
            Then não é possível editar o campo

        Scenario: novo e-mail não pode ser existente 
            And 

        Scenario: o campo nome completo não pode ter mais de 100 caracteres
            And digito no campo nome completo 101 caracteres
            | Nome completo | Davidson SantanaDavidson SantanaDavidson SantanaDavidson SantanaDavidson SantanaDavidson SantanaDavidson Santana |
            Then o site retorna a mensagem "Informe no máximo 100 letras no seu nome"

        Scenario: o campo email não pode ter mais de 60 caracteres
            And digito no campo email 61 caracteres
            Then o site devolve uma mensagem "Não foi possível atualizar suas informações"

        Scenario: o nome deve conter no mínimo 4 letras
            And digito no campo nome completo 
            | Nome completo | Dav |
            Then vejo a mensagem "Informe seu nome completo"

        Scenario: 

    