class GestãoPage{

    emailUsuario = '[name="email"]'
    senhaUsuario = '[name="password"]'
    confirmarSenhaUsuario = '[name="confirmPassword"]'
    nome = '[name="name"]'
    quantidade = '[name="amount"]'
    nomeLista = '[name="description"]'
    lixeira = '.dBZdCB'
    confirmar = '.iMjKmA'
    riscar = '.dHzcbv'
    riscado = '.Xhkyc'
    produto = '.ExnMO'
    cancelar = '.lcjWUB'
    tresBarrinhas = '.bgBaRw'

    usuario() {
        cy.visit('https://academy-lembra-compras.herokuapp.com/register')
        cy.get(this.nome).type('Elma Chips');
        cy.get(this.emailUsuario).type('elmachips@teste.com');
        cy.get(this.senhaUsuario).type('Elma1234');
        cy.get(this.confirmarSenhaUsuario).type('Elma1234');
        cy.contains('Registrar').click();
    }

    paginaLista() {
        cy.visit('https://academy-lembra-compras.herokuapp.com/login');
        cy.get(this.emailUsuario).type('elmachips@teste.com');
        cy.get(this.senhaUsuario).type('Elma1234');
        cy.contains('Entrar').click();
    }

    adicionarProduto(nomeProduto, quantidade) {
        cy.get(this.nome).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
    }

    removerProduto() {
        cy.get(this.lixeira).click();
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
        cy.contains('Finalizar a lista').click().get(this.confirmar).click();
    }

    salvarUmItem(nomeProduto, quantidade) {
        cy.get(this.nome).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
    }

    marcarCheckBox() {
        cy.get(this.riscar).click()
    }

    itemRiscado() {
        cy.get(this.riscado).should('be.visible');
        cy.contains('Finalizar a lista').click().get(this.confirmar).click();
    }

    finalizarLista() {
        cy.contains('Finalizar a lista').click()
    }

    confirmarFinalizar() {
        cy.get(this.confirmar).click();
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
        cy.contains('Finalizar a lista').click().get(this.confirmar).click();
    }

    salvarPeloMenosUm(nomeProduto, quantidade) {
        cy.contains('Finalizar a lista').click().get(this.confirmar).click();
        cy.wait(2500);
        cy.get(this.nome).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
        cy.wait(2500);
    }

    produtosNaLista() {
        cy.get(this.produto).eq(0).should('be.visible');
        cy.get(this.produto).eq(1).should('be.visible');
        cy.contains('Finalizar a lista').click().get(this.confirmar).click();
    }

    adicionarProdutos(nomeProduto, quantidade) {
            cy.get(this.nome).type(nomeProduto);
            cy.get(this.quantidade).clear().type(quantidade);
            cy.contains('button', '+').click();
            cy.contains('Salvar').click();
    }

    outroProduto(nomeProduto, quantidade) {
        cy.wait(2500);
        cy.get(this.nome).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
        cy.wait(1000);
    }

    produto1000(nomeProduto, quantidade) {
        cy.wait(2500)
        cy.get(this.nome).type(nomeProduto);
        cy.get(this.quantidade).clear().type(quantidade);
        cy.contains('button', '+').click();
    }

    cancelarLista() {
        cy.get(this.cancelar).click();
    }

    paginaListaCriada() {
        cy.contains('Finalizar a lista').should('be.visible');
        cy.contains('Finalizar a lista').click().get(this.confirmar).click();
        cy.wait(2000);
    }

    deslogar() {
        cy.get(this.tresBarrinhas).click({force: true})
        cy.contains('Sair').click({force: true});
    }

    listaCriada() {
        cy.contains('Finalizar a lista').should('be.visible');
    }

    atualizarPagina() {
        cy.contains('Histórico').click();
        cy.contains('Lista').click();
    }
}

export var gestaoPage = new GestãoPage();