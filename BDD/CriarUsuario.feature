Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar a página de registro de usuário
        Given acessei a página de registro de usuário

        Scenario: Cadastrar usuário com sucesso
            When registro os dados corretos do usuário
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Usuário criado com sucesso!"
            And sou direcionado para a página de login

        Scenario: Cadastrar usuário sem nome
            When registro os dados do usuário sem preencher o campo nome
            |    nomeUsuario     |                     |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Informe seu nome"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário sem email
            When registro os dados do usuário sem preencher o campo email
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |                     |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Informe seu e-mail"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário sem senha
            When registro os dados do usuário sem preencher o campo senha
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |                     |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Informe sua senha"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário sem confirmar senha
            When registro os dados do usuário sem preencher o campo confirmar senha
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |                     |
            Then visualizo a mensagem "Informe sua senha"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com um email já existente
            And o sistema possui um usuário cadastrado com os seguintes dados
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            When registro os dados do usuário utilizando um email já existente
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Este e-mail já é utilizado por outro usuário."
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com formato de email inválido sem arroba
            When registro os dados do usuário com email em formato inválido
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Formato de e-mail inválido." 
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com formato de email inválido sem texto após arroba
            When registro os dados do usuário com email em formato inválido 
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |     elmachips@      |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Formato de e-mail inválido." 
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com formato de email inválido sem texto após o ponto
            When registro os dados do usuário com email em formato inválido
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |   elmachips@teste.  |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Formato de e-mail inválido." 
            And permaneço na página de registro do usuário    

        Scenario: Cadastrar usuário com nome contendo menos de quatro caracteres
            When registro os dados do usuário com nome contendo menos de quatro caracteres
            |    nomeUsuario     |        Elm          |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Informe seu nome completo"   
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com nome com formato inválido
            When registro os dados do usuário com nome com formato inválido
            |    nomeUsuario     |        Elm%         |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Formato do nome é inválido."   
            And permaneço na página de registro do usuário

        Scenario: Visualizar senha no campo senha
            When preencho os dados do usuário 
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no ícone olho do campo senha
            Then visualizo a senha do usuário 
            |    senhaUsuario    |      Elma1234       |

        Scenario: Visualizar senha no campo confirmar senha
            When preencho os dados do usuário 
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no ícone olho do campo confirmar senha
            Then visualizo a senha do usuário 
            |  ConfSenhaUsuario  |      Elma1234       |

        Scenario: Cadastrar usuário com nome contendo 100 caracteres
            When registro os dados do usuário com nome contendo 100 caracteres
            |    nomeUsuario     | Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            |    mailUsuario     |                                elmachips@teste.com                                                   |
            |    senhaUsuario    |                                     Elma1234                                                         |
            |  ConfSenhaUsuario  |                                     Elma1234                                                         |
            Then visualizo a mensagem "Usuário criado com sucesso!"
            And sou direcionado para a página de login


        Scenario: Cadastrar usuário com nome contendo 101 caracteres
            When registro os dados do usuário com nome contendo 101 caracteres
            |    nomeUsuario     | Elma Chipssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            |    mailUsuario     |                                elmachips@teste.com                                                    |
            |    senhaUsuario    |                                     Elma1234                                                          |
            |  ConfSenhaUsuario  |                                     Elma1234                                                          |
            Then visualizo a mensagem "Informe no máximo 100 letras no seu nome"
            And permaneço na página de registro do usuário


        Scenario: Cadastrar usuário com email contendo 60 caracteres
            When registro os dados do usuário com email contendo 60 caracteres
            |    nomeUsuario     |                         Elma Chips                           |
            |    mailUsuario     | elmachipssssssssssssssssssssssssssssssssssssssssss@teste.com |
            |    senhaUsuario    |                          Elma1234                            |
            |  ConfSenhaUsuario  |                          Elma1234                            |
            Then visualizo a mensagem "Usuário criado com sucesso!"
            And sou direcionado para a página de login

        Scenario: Cadastrar usuário com email contendo 61 caracteres
            When registro os dados do usuário com email contendo 61 caracteres
            |    nomeUsuario     |                         Elma Chips                            |
            |    mailUsuario     | elmachipsssssssssssssssssssssssssssssssssssssssssss@teste.com |
            |    senhaUsuario    |                          Elma1234                             |
            |  ConfSenhaUsuario  |                          Elma1234                             |
            Then visualizo a mensagem "Informe no máximo 60 caracteres."
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com senha contendo 30 caracteres
            When registro os dados do usuário com senha contendo 30 caracteres
            |    nomeUsuario     |          Elma Chips            |
            |    mailUsuario     |      elmachips@teste.com       |
            |    senhaUsuario    | Elma12344444444444444444444444 |
            |  ConfSenhaUsuario  | Elma12344444444444444444444444 |
            Then visualizo a mensagem "Usuário criado com sucesso"    
            And sou direcionado para a página de login

        Scenario: Cadastrar usuário com campo senha contendo 31 caracteres
            When registro os dados do usuário com senha contendo 31 caracteres
            |    nomeUsuario     |          Elma Chips             |
            |    mailUsuario     |      elmachips@teste.com        |
            |    senhaUsuario    | Elma123444444444444444444444444 |
            |  ConfSenhaUsuario  | Elma12344444444444444444444444  |
            Then visualizo a mensagem "Informe no máximo 30 caracteres."
            And permaneço na página de registro do usuário     

        Scenario: Cadastrar usuário com campo confirmar senha contendo 31 caracteres
            When registro os dados do usuário com senha contendo 31 caracteres no campo confirmar senha
            |    nomeUsuario     |          Elma Chips             |
            |    mailUsuario     |      elmachips@teste.com        |
            |    senhaUsuario    | Elma12344444444444444444444444  |
            |  ConfSenhaUsuario  | Elma123444444444444444444444444 |
            Then visualizo a mensagem "Informe no máximo 30 caracteres." 
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com senhas diferentes nos campos senha e confirmar senha
            When registro senhas diferentes no campo senha e confirmar senha
            |    nomeUsuario     |     Elma Chips       |
            |    mailUsuario     | elmachips@teste.com  |
            |    senhaUsuario    |      Elma1234        |
            |  ConfSenhaUsuario  |      Elma12345       |
            Then visualizo a mensagem "As senhas não conferem."
            And permaneço na página de registro do usuário

        Scenario: Retornar à página de login
            When clico no botão Voltar à pagina de login
            Then retorno à pagina de login

            

        
    