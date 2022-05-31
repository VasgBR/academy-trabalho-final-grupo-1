class HistoricoPage {

    nome = '[name="name"]'
    email = '[name="email"]'
    senha = '[name="password"]'
    confirmaSenha = '[name="confirmPassword"]'
    quantidade = '[name="amount"]'
    confirmar = '.iMjKmA'
    listagem = ".kUIcKA"
    menu = '.bgBaRw'
    item = '.laysmB'
    
    cadastro(){
        cy.visit('https://academy-lembra-compras.herokuapp.com/register');
        cy.get(this.nome).type('Elma Chips');
        cy.get(this.email).type('elmachips@teste.com');
        cy.get(this.senha).type('Elma1234');
        cy.get(this.confirmaSenha).type('Elma1234');
        cy.contains("button", 'Registrar').click();
    }

    login(){
        cy.visit('https://academy-lembra-compras.herokuapp.com/login');
        cy.get(this.email).type('elmachips@teste.com');
        cy.get(this.senha).type('Elma1234');
        cy.contains('Entrar').click(); 
        cy.wait(1000);
    }

    salvarLista() {
        cy.contains('Salvar').click();
    }

    finalizarLista(){
        cy.contains('Finalizar a lista').click
    }

    confirmarFinalizar() {
        cy.get(this.confirmar).click();

    }

    paginaListaCriada(){
        cy.contains('Finalizar a lista').should('be.visible');
        cy.contains('Finalizar a lista').click().get('.iMjKmA').click();
        cy.wait(2500);  
    }

    listaCriada(){
        cy.contains('Finalizar a lista').should('be.visible');
        cy.contains('Confirmar').click(); 
    }

    visualizarListas(){
        cy.contains('Histórico').click({force: true});
    }

    visualizarItensLista(){
        cy.contains('Histórico').click().get('.kUIcKA').click();
        cy.wait(3000);  
    }

    visualizarLista(){
    cy.get(this.listagem).eq(0).should('be.visible');
    cy.get(this.listagem).eq(1).should('be.visible');
    cy.get(this.listagem).eq(2).should('be.visible');
    cy.get(this.listagem).eq(3).should('be.visible');
    cy.get(this.listagem).eq(4).should('be.visible');
    cy.get(this.listagem).eq(5).should('be.visible');
    cy.get(this.listagem).eq(6).should('be.visible');
    cy.get(this.listagem).eq(7).should('be.visible');
    cy.get(this.listagem).eq(8).should('be.visible');
    cy.get(this.listagem).eq(9).should('be.visible');
    cy.get(this.listagem).eq(10).should('not.exist');
    }

    visualizarItensLista(){
        cy.get(this.listagem).eq(0).click({force: true});
    }

    visualizaListas(){
        cy.contains('Histórico').click();
    }

    deslogar() {
        cy.get(this.menu).click({force: true})
        cy.contains('Sair').click({force: true});
    }

    adicionarItem() {
        cy.get(this.nome).type('Cebolitos');
        cy.get(this.quantidade).clear().type('2');
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
        cy.contains('Finalizar a lista').click();
        cy.contains('Confirmar').click();
        cy.wait(2500);
        cy.get(this.nome).type('Cebolitos');
        cy.get(this.quantidade).clear().type('2');
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
        cy.contains('Finalizar a lista').click();
        cy.contains('Confirmar').click();
        cy.wait(2500);
        cy.get(this.nome).type('Cebolitos');
        cy.get(this.quantidade).clear().type('2');
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
        cy.contains('Finalizar a lista').click();
        cy.contains('Confirmar').click();
        cy.wait(2500);
        cy.get(this.nome).type('Cebolitos');
        cy.get(this.quantidade).clear().type('2');
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
        cy.contains('Finalizar a lista').click();
        cy.contains('Confirmar').click();
        cy.wait(2500);
        cy.get(this.nome).type('Cebolitos');
        cy.get(this.quantidade).clear().type('2');
        cy.contains('button', '+').click();
        cy.contains('Salvar').click();
        cy.contains('Finalizar a lista').click();
        cy.contains('Confirmar').click();
        cy.wait(2500);
    }

    nomeQuantidade() {
        cy.get(this.item).should('be.visible');
    }
};

export var historicoPage = new HistoricoPage