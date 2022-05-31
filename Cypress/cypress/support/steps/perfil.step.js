import { perfilPage } from "../pages/perfilPage.po"

Given("que acessei o site Lembra Compras", () => {
    perfilPage.logarUsuario();
});

Given("na página Perfil", () => {
    perfilPage.acessarPaginaPerfil();
});

When("atualizo o nome", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.atualizarNome(dados.nomeCompleto);
});

When("atualizo o email", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.atualizarEmail(dados.email);
});

When("insiro um email já cadastrado", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.emailJaCadastrado(dados.email);
});
When("atualizo o nome do usuário para conter 100 caracteres", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.nomeAteCemCaracteres(dados.nomeCompleto);
});
When("atualizo o nome do usuário para conter 101 caracteres", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.nomeMaisCemCaracteres(dados.nomeCompleto);
});
When("atualizo o email do usuário para conter 60 caracteres", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.emailAte60Caracteres(dados.email);
});
When("atualizo o email do usuário para conter 61 caracteres", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.emailMais60caracteres(dados.email); 
})
When("atualizo o email do usuário para conter 101 caracteres", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.emailMaisCemcaracteres(dados.email);
});
When("atualizo o campo nome completo para ter menos de 4 letras", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.nomeCom3Letras(dados.nomeCompleto)
});
When("atualizo o campo nome completo com caractere especial", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.nomeEspecial(dados.nomeCompleto);
});
When("atualizo um email inválido", (tabela) => {
    var dados = tabela.rowsHash();
    perfilPage.emailInvalido(dados.email); 
});
Then("visualizo a mensagem {string}", (mensagem) => {
     perfilPage.validarMensagem(mensagem).should("be.visible");
});

