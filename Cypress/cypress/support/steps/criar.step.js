import { criarPage } from "../pages/criarPage.po"

Given ("acessei a página de registro de usuário", () => {
    criarPage.visitarRegistro();
});

When ("registro os dados corretos do usuário", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});

Then ("visualizo a mensagem {string}", (mensagemCadastro) => {
    cy.contains(mensagemCadastro).should("be.visible");
});

And ("sou direcionado para a página de login", () => {
    cy.url().should("eq", "https://academy-lembra-compras.herokuapp.com/login")
});

When ("registro os dados do usuário sem preencher o campo nome", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherDadosSemNome(dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

And ("permaneço na página de registro do usuário", () => {
    cy.url().should("eq", "https://academy-lembra-compras.herokuapp.com/register")
});

When ("registro os dados do usuário sem preencher o campo email", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherDadosSemEmail(dadosTabela.nomeUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("registro os dados do usuário sem preencher o campo senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherDadosSemSenha(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("registro os dados do usuário sem preencher o campo confirmar senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherDadosSemConfSenha(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario);
    criarPage.registrarUsuario();
});

When ("o sistema possui um usuário cadastrado com os seguintes dados", (tabela) => {

});

When ("registro os dados do usuário utilizando um email já existente", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 422,
        });
});

When ("registro os dados do usuário com email em formato inválido", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("registro os dados do usuário com nome contendo menos de quatro caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("registro os dados do usuário com nome com formato inválido", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("preencho os dados do usuário", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
});

And ("clico no ícone olho do campo senha", () => {
    criarPage.clicarIconeOlhoSenha();
});

Then ("visualizo a senha do usuário no campo senha", () => {
    criarPage.testeAtributoSenha();
});

And ("clico no ícone olho do campo confirmar senha", () => {
    criarPage.clicarIconeOlhoConfSenha();
});

Then ("visualizo a senha do usuário no campo confirmar senha", () => {
    criarPage.testeAtributoConfSenha();
});

When ("registro os dados do usuário com nome contendo 100 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});

When ("registro os dados do usuário com nome contendo 101 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("registro os dados do usuário com email contendo 60 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});

When ("registro os dados do usuário com email contendo 61 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});

When ("registro os dados do usuário com senha contendo 30 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});

When ("registro os dados do usuário com senha contendo 31 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("registro os dados do usuário com senha contendo 31 caracteres no campo confirmar senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("registro senhas diferentes no campo senha e confirmar senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
});

When ("clico no botão Voltar à pagina de login", () => {
    criarPage.voltarTelaLogin();
});









// A paartir daqui era o antigo
Given ("acessei a página do sistema", () => {
    criarUsuario.visitarSistema();
    criarUsuario.clicarBotaoNovo();
});

Given ("acessei a página de cadastro de um novo usuário", () => {
    criarUsuario.visitarNovo();
});

When ("informo os dados válidos de um novo usuário", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
    cy.intercept("https://crud-api-academy.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});


When ("informo os dados de um novo usuário com formato de email inválido", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
});

Then ("visualizo a mensagem de erro com modal {string}", (mensagemCadastro) => {
    cy.contains(mensagemCadastro).should("be.visible");
    criarUsuario.verificarModalErro();
});

Then ("visualizo a mensagem de erro {string}", (mensagemCadastro) => {
    cy.contains(mensagemCadastro).should("be.visible");
});

When ("informo os dados de um novo usuário com formato de nome inválido", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
});

When ("informo os dados de um novo usuário cujo nome tenha menos de quatro caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
});

When ("informo os dados de um novo usuário cujo nome tenha 100 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
    cy.intercept("https://crud-api-academy.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});

When ("informo os dados de um novo usuário cujo nome tenha mais de 100 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
});

When ("informo os dados de um novo usuário cujo e-mail tenha 60 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
    cy.intercept("https://crud-api-academy.herokuapp.com/api/v1/users", {
        statusCode: 201,
        });
});

When ("informo os dados de um novo usuário cujo e-mail tenha mais de 60 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
});

When ("informo os dados de um novo usuário sem informar o e-mail", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNome(dadosTabela.nome);
    criarUsuario.salvarUsuario();
});

When ("informo os dados de um novo usuário sem informar o nome", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherEmail(dadosTabela.email);
    criarUsuario.salvarUsuario();
});

When ("informo os dados de um novo usuário utilizado um e-mail já existente", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
    criarUsuario.salvarUsuario();
    cy.intercept("https://crud-api-academy.herokuapp.com/api/v1/users", {
        statusCode: 422,
        });
});

When ("informo os dados de um novo usuário", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarUsuario.preencherNomeEEmail(dadosTabela.nome, dadosTabela.email);
});

And ("o sistema retorna erro no servidor", () => {
    criarUsuario.salvarUsuario();
    cy.intercept("https://crud-api-academy.herokuapp.com/api/v1/users", {
        statusCode: 500,
        });
});

And ("o sistema retorna bad request", () => {
    criarUsuario.salvarUsuario();
    cy.intercept("https://crud-api-academy.herokuapp.com/api/v1/users", {
        statusCode: 400,
        });
});
