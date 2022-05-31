import {historicoPage} from "../pages/HistoricoPage.po";

const { Before, After } = require("cypress-cucumber-preprocessor/steps");

Before({tags: '@historicoCadastro'}, () => {
    historicoPage.cadastro();
})

After({tags: '@historicoLogout'}, () => {
   historicoPage.deslogar();
})

Given('que acessei o site Lembra Compras', () =>{
    historicoPage.login();
})

Given('acessei a página histórico', () =>{
    historicoPage.visualizarListas();
})

Given('tenho listas cadastradas', () => {
    historicoPage.adicionarItem();
})

When('clico em uma das listas cadastradas', () =>{
    historicoPage.visualizarItensLista();
})

When('adicionei um produto na lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    historicoPage.adicionarProduto(dadosTabela.produto, dadosTabela.quantidade);
})

Then('o sistema deve mostrar o nome e a data de criação apenas das 10 últimas listas cadastradas', () => {
    historicoPage.visualizarLista();
})

Then('o sistema mostra todos os itens e quantidades dos produtos cadastrados na lista de compras', () => {
    historicoPage.nomeQuantidade();
})