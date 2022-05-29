import { gestaoPage } from '../pages/gestaoPage.po'

Given('acessei o site Lembra Compras e estou na página de Lista', () => {
    gestaoPage.paginaLista();
})

When('adiciono um produto na lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.adicionarProduto(dadosTabela.nomeProduto, dadosTabela.quantidade);
})

When('clico no símbolo de Lixeira', () => {
    gestaoPage.removerProduto();
})

When('dou um nome para minha lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.nomeDaLista(dadosTabela.nomeLista);
})

When('salvo a lista', () => {
    gestaoPage.salvarLista();
})

When('salvo a lista com pelo menos um item', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.salvarUmItem(dadosTabela.nomeProduto, dadosTabela.quantidade);
})

When('marco a caixa de seleção do item na lista', () => {
    gestaoPage.marcarCheckBox();
})

When('finalizo a lista', () => {
    gestaoPage.finalizarLista();
})

When('confirmo a finalização da lista', () => {
    gestaoPage.confirmarFinalizar();
})

When('adiciono um produto na lista sem preencher o campo nome e com quantidade igual a 0', (tabela) => {
    var dadosTabela = tabela.rowsHash(); 
    gestaoPage.soQuantidade(dadosTabela.quantidade);
})

When('adiciono um produto na lista sem preencher o campo nome', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.soQuantidade(dadosTabela.quantidade)
})

When('adiciono um produto na lista com quantidade igual a 0', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.salvarUmItem(dadosTabela.nomeProduto, dadosTabela.quantidade);
})

When('salvo a lista adicionando o mesmo produto novamente', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.salvarUmItem(dadosTabela.nomeProduto, dadosTabela.quantidade);
})

When('adiciono o mesmo produto na lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.adicionarProduto(dadosTabela.nomeProduto, dadosTabela.quantidade);
})

When('salvo pelo menos um item na lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.salvarPeloMenosUm(dadosTabela.nomeProduto, dadosTabela.quantidade);
})

When('salvo a lista adicionando um outro produto na lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.adicionarProdutos(dadosTabela.nomeProduto, dadosTabela.quantidade);
})

When('adiciono outro produto na lista', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.outroProduto(dadosTabela.nomeProduto, dadosTabela.quantidade)
})

Then('removo um item da lista', () => {
    gestaoPage.removiProduto();
})

Then('visualizo a mensagem de sucesso {string}', (mensagemSucesso) => {
    gestaoPage.mensagemSucesso(mensagemSucesso);
})

Then('o item é riscado', () => {
    gestaoPage.itemRiscado();
})

Then('visualizo a mensagem de erro {string}', (mensagemErro) => {
    gestaoPage.mensagemErro(mensagemErro);
})

Then('visualizo as mensagens de erro', (tabela) => {
    var dadosTabela = tabela.rowsHash();
    gestaoPage.mensagensErro(dadosTabela.mensagem1, dadosTabela.mensagem2);
})

Then('o sistema deve somar a quantidade dos produtos adicionados', () => {
    gestaoPage.somaQuantidade();
})

Then('o sistema deve me apresentar os dois produtos na lista', () => {
    gestaoPage.produtosNaLista();
})