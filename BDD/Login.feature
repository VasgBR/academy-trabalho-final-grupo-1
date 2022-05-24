Feature: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras.

    Background: acesso à página de login
        Given que eu tenha um cadastro prévio na aplicação
        | mailUser | gabrielleteste@gmail.com |
        | passUser |        Teste@123         |
        When vou em login
    
        Scenario: login com sucesso
            And insiro meu e-mail cadastrado
            | mailUser | gabrielleteste@gmail.com |
            And insiro minha senha cadastrada
            | passUser |        Teste@123         |
            And clico em "Entrar" 
            Then o usuário é autenticado
            And o login é efetuado

        Scenario: login com e-mail diferente
            And insiro um e-mail diferente do cadastrado
            | mailUser |   gabriellete@gmail.com  |
            And insiro minha senha cadastrada
            | passUser |        Teste@123         |
            Then visualizo a mensagem "E-mail ou senha incorretos."

        Scenario: login com senha diferente
            And insiro meu e-mail cadastrado
            | mailUser | gabrielleteste@gmail.com |
            And insiro uma senha diferente da cadastrada
            | passUser |        Teste@teste       |
            Then visualizo a mensagem "E-mail ou senha incorretos."

        Scenario: login sem e-mail
            And não insiro um e-mail
            And insiro minha senha cadastrada
            | passUser |        Teste@123         |
            Then visualizo a mensagem "Informe seu e-mail"
            And o campo de e-mail é ativado para inserção

        Scenario: login sem senha
            And insiro meu e-mail cadastrado
            | mailUser | gabrielleteste@gmail.com |
            And não insiro uma senha
            Then visualizo a mensagem "Informe sua senha"
            And o campo de senha é ativado para inserção