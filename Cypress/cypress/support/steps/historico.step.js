import {historicoPage} from "../pages/HistoricoPage.po";

before(() => {
    historicoPage.cadastro();
})

//afterEach(() => {
  //  historicoPage.deslogar();
//})

Given('que acessei o site Lembra Compras', () =>{
    historicoPage.login();
})

When('tenho listas cadastradas', () => {
    historicoPage.adicionarItem();
})

When('adicionei um produto na lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    historicoPage.adicionarProduto(dadosTabela.produto, dadosTabela.quantidade);
})

Given('acessei a página histórico', () =>{
    historicoPage.visualizarListas();
})

Given('clico em uma das listas cadastradas', () =>{
    historicoPage.visualizarItensLista();
})