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

When ("registro os dados do usuário sem preencher o campo nome", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherDadosSemNome(dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
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

When ("o sistema possui um usuário cadastrado com os seguintes dados", () => {

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

When ("registro os dados do usuário quando o servidor está com erro interno", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    criarPage.preencherTodosDados(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    criarPage.registrarUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 500,
        });
});

Then ("visualizo a mensagem {string}", (mensagemCadastro) => {
    cy.contains(mensagemCadastro).should("be.visible");
});

Then ("visualizo a senha do usuário no campo senha", () => {
    criarPage.testeAtributoSenha();
});

Then ("visualizo a senha do usuário no campo confirmar senha", () => {
    criarPage.testeAtributoConfSenha();
});

And ("sou direcionado para a página de login", () => {
    cy.url().should("eq", "https://academy-lembra-compras.herokuapp.com/login")
});

And ("permaneço na página de registro do usuário", () => {
    cy.url().should("eq", "https://academy-lembra-compras.herokuapp.com/register")
});

And ("clico no ícone olho do campo senha", () => {
    criarPage.clicarIconeOlhoSenha();
});

And ("clico no ícone olho do campo confirmar senha", () => {
    criarPage.clicarIconeOlhoConfSenha();
});

