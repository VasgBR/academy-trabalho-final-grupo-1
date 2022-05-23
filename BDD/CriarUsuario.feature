Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar a página de registro de usuário
        Given acessei a página de registro de usuário

        Scenario: Cadastrar usuário com sucesso
            When preencho os dados corretos do usuário
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Usuário criado com sucesso!"

        Scenario: Cadastrar usuário sem nome
            When preencho os dados do usuário sem preencher o campo nome
            |    nomeUsuario     |                     |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe seu nome"

        Scenario: Cadastrar usuário sem email
            When preencho os dados do usuário sem preencher o campo email
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |                     |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe seu e-mail"

        Scenario: Cadastrar usuário sem senha
            When preencho os dados do usuário sem preencher o campo senha
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |                     |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe sua senha"

        Scenario: Cadastrar usuário sem confirmar senha
            When preencho os dados do usuário sem preencher o campo confirmar senha
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |                     |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe sua senha"

        Scenario: Cadastrar usuário com um email já existente
            And o sistema possui um usuário cadastrado com os seguintes dados
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            When preencho os dados do usuário utilizando um email já existente
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Este e-mail já é utilizado por outro usuário."

        Scenario: Cadastrar usuário com formato de email inválido sem arroba
            When preencho os dados do usuário com email em formato inválido
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Formato de e-mail inválido." 
            And visualizo a mensagem "Inclua um '@' no endereço de email. 'elmachips' está com um '@' faltando." 

        Scenario: Cadastrar usuário com formato de email inválido sem texto após arroba
            When preencho os dados do usuário com email em formato inválido 
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |     elmachips@      |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Formato de e-mail inválido." 
            And visualizo a mensagem "Insira uma parte depois de '@'. 'elmachips@' está incompleto."     

        Scenario: Cadastrar usuário com formato de email inválido sem texto após o ponto
            When preencho os dados do usuário com email em formato inválido
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     |   elmachips@teste.  |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Formato de e-mail inválido." 
            And visualizo a mensagem "'.' está sendo usado em uma posição incorreta em 'teste.'."     

        Scenario: Cadastrar usuário com nome contendo menos de quatro caracteres
            When preencho os dados do usuário com nome contendo menos de quatro caracteres
            |    nomeUsuario     |        Elm          |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe seu nome completo"   

        Scenario: Cadastrar usuário com nome com formato inválido
            When preencho os dados do usuário com nome com formato inválido
            |    nomeUsuario     |        Elm%         |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no botão Registrar
            Then visualizo a mensagem "Formato do nome é inválido."   

        Scenario: Visualizar senha no campo senha
            When preencho os dados do usuário 
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no ícone Olho do campo senha
            Then visualizo a senha do usuário 
            |    senhaUsuario    |      Elma1234       |

        Scenario: Visualizar senha no campo confirmar senha
            When preencho os dados do usuário 
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            And clico no ícone Olho do campo confirmar senha
            Then visualizo a senha do usuário 
            |  ConfSenhaUsuario  |      Elma1234       |

        Scenario: Cadastrar usuário com nome contendo 100 caracteres
            When preencho os dados do usuário com nome contendo 100 caracteres
            |    nomeUsuario     | Elma Chipsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            |    mailUsuario     |                                elmachips@teste.com                                                   |
            |    senhaUsuario    |                                     Elma1234                                                         |
            |  ConfSenhaUsuario  |                                     Elma1234                                                         |
            And clico no botão Registrar
            Then visualizo a mensagem "Usuário criado com sucesso!"

        Scenario: Cadastrar usuário com nome contendo 101 caracteres
            When preencho os dados do usuário com nome contendo 101 caracteres
            |    nomeUsuario     | Elma Chipssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss |
            |    mailUsuario     |                                elmachips@teste.com                                                    |
            |    senhaUsuario    |                                     Elma1234                                                          |
            |  ConfSenhaUsuario  |                                     Elma1234                                                          |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe no máximo 100 letras no seu nome"

        Scenario: Cadastrar usuário com email contendo 60 caracteres
            When preencho os dados do usuário com email contendo 60 caracteres
            |    nomeUsuario     |                         Elma Chips                           |
            |    mailUsuario     | elmachipssssssssssssssssssssssssssssssssssssssssss@teste.com |
            |    senhaUsuario    |                          Elma1234                            |
            |  ConfSenhaUsuario  |                          Elma1234                            |
            And clico no botão Registrar
            Then visualizo a mensagem "Usuário criado com sucesso!"

        Scenario: Cadastrar usuário com email contendo 61 caracteres
            When preencho os dados do usuário com email contendo 61 caracteres
            |    nomeUsuario     |                         Elma Chips                            |
            |    mailUsuario     | elmachipsssssssssssssssssssssssssssssssssssssssssss@teste.com |
            |    senhaUsuario    |                          Elma1234                             |
            |  ConfSenhaUsuario  |                          Elma1234                             |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe no máximo 60 caracteres."

        Scenario: Cadastrar usuário com senha contendo 30 caracteres
            When preencho os dados do usuário com senha contendo 30 caracteres
            |    nomeUsuario     |          Elma Chips            |
            |    mailUsuario     |      elmachips@teste.com       |
            |    senhaUsuario    | Elma12344444444444444444444444 |
            |  ConfSenhaUsuario  | Elma12344444444444444444444444 |
            And clico no botão Registrar
            Then visualizo a mensagem "Usuário criado com sucesso"    

        Scenario: Cadastrar usuário com senha contendo 31 caracteres
            When preencho os dados do usuário com senha contendo 31 caracteres
            |    nomeUsuario     |          Elma Chips             |
            |    mailUsuario     |      elmachips@teste.com        |
            |    senhaUsuario    | Elma123444444444444444444444444 |
            |  ConfSenhaUsuario  | Elma12344444444444444444444444  |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe no máximo 30 caracteres."     

        Scenario: Cadastrar usuário com campo confirmar senha contendo 31 caracteres
            When preencho os dados do usuário com senha contendo 31 caracteres no campo confirmar senha
            |    nomeUsuario     |          Elma Chips             |
            |    mailUsuario     |      elmachips@teste.com        |
            |    senhaUsuario    | Elma12344444444444444444444444  |
            |  ConfSenhaUsuario  | Elma123444444444444444444444444 |
            And clico no botão Registrar
            Then visualizo a mensagem "Informe no máximo 30 caracteres." 

        Scenario: Cadastrar usuário com senhas diferentes nos campos senha e confirmar senha
            When preencho senhas diferentes no campo senha e confirmar senha
            |    nomeUsuario     |     Elma Chips       |
            |    mailUsuario     | elmachips@teste.com  |
            |    senhaUsuario    |      Elma1234        |
            |  ConfSenhaUsuario  |      Elma12345       |
            And clico no botão Registrar
            Then visualizo a mensagem "As senhas não conferem."

        Scenario: Retornar a página de login
            Given acessei a página de registro de usuário
            When clico no botão Voltar à pagina de login
            Then retorno à pagina de login

            

        
    