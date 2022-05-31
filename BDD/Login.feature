Feature: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras.

    Background: acesso à página de login
        Given que eu tenha um cadastro prévio na aplicação
        |    mailUsuario     | elmachips@teste.com |
        |    senhaUsuario    |      Elma1234       |
        And acessei a página de login
    
        Scenario: login com sucesso
            When faço login com os dados cadastrados
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            Then o usuário é autenticado
            And sou direcionado para a página de lista

        Scenario: login com e-mail não cadastrado
            When faço login com um e-mail não cadastrado
            |    mailUsuario     |  elmaelma@teste.com |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "E-mail ou senha incorretos."
            And permaneço na página de login

        Scenario: login com senha não cadastrada
            When faço login com uma senha não cadastrada
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      1234Elma       |
            Then visualizo a mensagem "E-mail ou senha incorretos."
            And permaneço na página de login

        Scenario: login sem e-mail
            When faço login sem inserir e-mail
            |    mailUsuario     |                     |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "Informe seu e-mail"
            And o campo de e-mail é ativado para inserção

        Scenario: login sem senha
            When faço login sem inserir senha
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |                     |
            Then visualizo a mensagem "Informe sua senha"
            And o campo de senha é ativado para inserção

        Scenario: login sem e-mail e senha
            When faço login sem inserir e-mail e senha
            |    mailUsuario     |                     |
            |    senhaUsuario    |                     |
            Then visualizo a mensagem "Informe seu e-mail"
            And visualizo a mensagem "Informe sua senha"
            And o campo de e-mail é ativado para inserção

        Scenario: ir para a página de register
            When clico no botão "Registre-se"
            Then sou direcionado para a página de register