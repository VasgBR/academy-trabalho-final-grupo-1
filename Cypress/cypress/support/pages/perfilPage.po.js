class perfilUsuario {

    nameUsuario = "[name='name']"
    emailUsuario = "[name='email']"
    senhaUsuario = "[name='password']"
    confirmarSenhaUsuario = "[name='confirmPassword']"
    botaoConfirmarAlteracoes = ".jmKUXo"
    botaoConfirmar = ".iMjKmA"
    
    registrarUsuario() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/register");
        cy.get(this.nameUsuario).type("Elma Chips");
        cy.get(this.emailUsuario).type("elmachips@presunto.com");
        cy.get(this.senhaUsuario).type("Elma1234");
        cy.get(this.confirmarSenhaUsuario).type("Elma1234");
        cy.contains("button", "Registrar").click({force: true});
        cy.visit("https://academy-lembra-compras.herokuapp.com/register");
        cy.get(this.nameUsuario).type("Elma Chips");
        cy.get(this.emailUsuario).type("elmachips@queijo.com");
        cy.get(this.senhaUsuario).type("Elma1234");
        cy.get(this.confirmarSenhaUsuario).type("Elma1234");
        cy.contains("button", "Registrar").click({force: true});
    }
    logarUsuario() {
        cy.visit("/login");
        cy.get(this.emailUsuario).type("elmachips@presunto.com");
        cy.get(this.senhaUsuario).type("Elma1234");
        cy.contains("Entrar").click();
    }
    deslogarUsuario() {
        cy.get('.bgBaRw').click({force: true}); 
        cy.contains("Sair").click({force: true});
    }
    acessarPaginaPerfil() {
        cy.get('.bgBaRw').click({force: true});   
        cy.contains("Perfil").click({force: true});
    }
    atualizarNome(nomeCompleto) {
        cy.wait(500);
        cy.get(this.nameUsuario).clear().type(nomeCompleto);
        cy.get(this.botaoConfirmarAlteracoes).click({force: true});
        cy.get(this.botaoConfirmar).click();
    }
    atualizarEmail(email) {
        cy.wait(500);
        cy.get(this.emailUsuario).clear().type(email);
        cy.get(this.botaoConfirmarAlteracoes).click();
        cy.get(this.botaoConfirmar).click();
    }
    emailJaCadastrado(email) {
        cy.wait(500);
        cy.get(this.emailUsuario).clear().type(email);
        cy.get(this.botaoConfirmarAlteracoes).click();
        cy.get(this.botaoConfirmar).click();
    }
    nomeAteCemCaracteres(nomeCompleto) {
        cy.wait(1000);
        cy.get(this.nameUsuario).clear().type(nomeCompleto);
        cy.get(this.botaoConfirmarAlteracoes).click();
        cy.get(this.botaoConfirmar).click();
    }
    nomeMaisCemCaracteres(nomeCompleto) {
        cy.wait(1000);
        cy.get(this.nameUsuario).clear().type(nomeCompleto);
        cy.get(this.botaoConfirmarAlteracoes).click();
    }
    emailAte60Caracteres(email) {
        cy.wait(1000);
        cy.get(this.emailUsuario).clear().type(email);
        cy.get(this.botaoConfirmarAlteracoes).click();
        cy.get(this.botaoConfirmar).click();
    }
    emailMais60caracteres(email) {
        cy.wait(1000);
        cy.get(this.emailUsuario).clear().type(email);
        cy.get(this.botaoConfirmarAlteracoes).click();
        cy.get(this.botaoConfirmar).click();
    }
    emailMaisCemcaracteres(email) {
        cy.wait(1000);
        cy.get(this.emailUsuario).clear().type(email);
        cy.get(this.botaoConfirmarAlteracoes).click();
    }
    nomeCom3Letras(nomeCompleto) {
        cy.wait(1000);
        cy.get(this.nameUsuario).clear().type(nomeCompleto);
        cy.get(this.botaoConfirmarAlteracoes).click();
    }
    nomeEspecial(nomeCompleto) {
        cy.wait(1000);
        cy.get(this.nameUsuario).clear().type(nomeCompleto);
        cy.get(this.botaoConfirmarAlteracoes).click();
    }
    emailInvalido(email) {
        cy.wait(1000);
        cy.get(this.emailUsuario).clear().type(email);
        cy.get(this.botaoConfirmarAlteracoes).click();
    }


}

export var perfilPage = new perfilUsuario();