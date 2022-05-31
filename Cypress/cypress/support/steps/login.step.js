import { loginPage } from "../pages/loginPage.po"

Given ("que eu tenha um cadastro prévio na aplicação", (tabela) => {
    loginPage.visitarLogin();
});

When ("o sistema possui um usuário cadastrado com os seguintes dados", () => {
});

When ("faço login com os dados cadastrados", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherTodosDados(dadosTabela.mailUsuario, dadosTabela.senhaUsuario);
    loginPage.loginUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/auth/login", {
        statusCode: 200,
    });
});

When ("faço login com um e-mail não cadastrado", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherTodosDados(dadosTabela.mailUsuario, dadosTabela.senhaUsuario);
    loginPage.loginUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/auth/login", {
        statusCode: 403,
    });
});

When ("faço login com uma senha não cadastrada", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherTodosDados(dadosTabela.mailUsuario, dadosTabela.senhaUsuario);
    loginPage.loginUsuario();
    cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/auth/login", {
        statusCode: 403,
    });
});

When ("faço login sem inserir e-mail", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherTodosDados(dadosTabela.senhaUsuario);
    loginPage.loginUsuario();
});

When ("faço login sem inserir senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherTodosDados(dadosTabela.mailUsuario);
    loginPage.loginUsuario();
});

When ("faço login sem inserir e-mail e senha", () => {
    loginPage.loginUsuario();
});

Then ("sou direcionado para a página de lista", () => {
    loginPage.verificarUrlLista();
});