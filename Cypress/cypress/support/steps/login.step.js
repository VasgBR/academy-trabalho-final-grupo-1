import { loginPage } from "../pages/loginPage.po"

Given ("que eu tenha um cadastro prévio na aplicação", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherDadosCadastros(dadosTabela.nomeUsuario, dadosTabela.mailUsuario, dadosTabela.senhaUsuario, dadosTabela.ConfSenhaUsuario);
    loginPage.visitarLogin();
});

Given ("acessei a página de login", () => {
    loginPage.visitarLogin();
});

When ("faço login com os dados cadastrados", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherTodosDados(dadosTabela.mailUsuario, dadosTabela.senhaUsuario);
    loginPage.loginUsuario();
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
    loginPage.preencherDadosSemEmail(dadosTabela.senhaUsuario);
    loginPage.loginUsuario();
});

When ("faço login sem inserir senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherDadosSemSenha(dadosTabela.mailUsuario);
    loginPage.loginUsuario();
});

When ("faço login sem inserir e-mail e senha", () => {
    loginPage.loginUsuario();
});

When ("clico no botão Registre-se", () => {
    loginPage.clicarBotaoRegistrese();
});

Then ("sou direcionado para a página de lista", () => {
    loginPage.verificarUrlLista();
    loginPage.logout();
});

Then ("permaneço na página de login", () => {
    loginPage.verificarUrlLogin();
});

Then ("sou direcionado para a página de register", () => {
    loginPage.verificarUrlRegistro();
});