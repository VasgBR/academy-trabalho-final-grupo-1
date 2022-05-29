class GestãoPage{

    emailUsuario = '[name="email"]'
    senhaUsuario = '[name="password"]'
    nomeProduto = '[name="name"]'
    quantidade = '[name="amount"]'
    nomeLista = '[name="description"]'

    paginaLista() {
        cy.visit('https://academy-lembra-compras.herokuapp.com/login');
        cy.get(this.emailUsuario).type('vitor@galinari.com');
        cy.get(this.senhaUsuario).type('1410');
        cy.contains('Entrar').click();
    }

    adicionarProduto(nomeProduto, quantidade) {
        cy.get(this.nomeProduto).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
    }

    removerProduto() {
        cy.get('.dBZdCB').click();
    }

    removiProduto() {
        cy.contains('Cebolitos').should('not.exist')
    }

    nomeDaLista(nomeLista) {
        cy.get(this.nomeLista).type(nomeLista)
    }

    salvarLista() {
        cy.contains('Salvar').click();
    }

    mensagemSucesso(mensagemSucesso) {
        cy.contains(mensagemSucesso).should('be.visible');
        cy.contains('Finalizar a lista').click().get('.iMjKmA').click();
    }

    salvarUmItem(nomeProduto, quantidade) {
        cy.get(this.nomeProduto).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
    }

    marcarCheckBox() {
        cy.get('.dHzcbv').click()
    }

    itemRiscado() {
        cy.get('.Xhkyc').should('be.visible');
        cy.contains('Finalizar a lista').click().get('.iMjKmA').click();
    }

    finalizarLista() {
        cy.contains('Finalizar a lista').click()
    }

    confirmarFinalizar() {
        cy.get('.iMjKmA').click();
    }

    mensagemErro(mensagemErro) {
        cy.contains(mensagemErro).should('be.visible');
    }

    soQuantidade(quantidade) {
        cy.get(this.quantidade).clear().type(quantidade)
        cy.contains('button', '+').click();
    }

    mensagensErro(mensagem1, mensagem2) {
        cy.contains(mensagem1).should('be.visible');
        cy.contains(mensagem2).should('be.visible');
    }

    somaQuantidade() {
        cy.contains('4' + 'x - ' + 'Cebolitos').should('be.visible');
        cy.contains('Finalizar a lista').click().get('.iMjKmA').click();
    }

    salvarPeloMenosUm(nomeProduto, quantidade) {
        cy.contains('Finalizar a lista').click().get('.iMjKmA').click();
        cy.wait(3000);
        cy.get(this.nomeProduto).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
        cy.wait(3000);
    }

    produtosNaLista() {
        cy.get('.ExnMO').eq(0).should('be.visible');
        cy.get('.ExnMO').eq(1).should('be.visible');
        cy.contains('Finalizar a lista').click().get('.iMjKmA').click();
    }

    adicionarProdutos(nomeProduto, quantidade) {
            cy.get(this.nomeProduto).type(nomeProduto);
            cy.get(this.quantidade).clear().type(quantidade);
            cy.contains('button', '+').click();
            cy.contains('Salvar').click();
    }

    outroProduto(nomeProduto, quantidade) {
        cy.wait(3000);
        cy.get(this.nomeProduto).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
        cy.wait(1000);
    }
}

export var gestaoPage = new GestãoPage();