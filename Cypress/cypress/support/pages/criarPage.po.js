/// <reference types="cypress" />

class CriarPage {
    // Atributos da classe são os seletores da nossa tela
    inputNomeUsuario = "[name='name']";
    inputEmailUsuario = "[name='email']";
    inputSenha = "[name='password']";
    inputConfSenha = "[name='confirmPassword']";
    buttonRegistrar = "button.sc-ftvSup";
    iconOlho = ".sc-BeQoi";
    buttonVoltar = ".sc-crXcEl";

    

    visitarRegistro() {
        cy.visit("register");
    }
    
    preencherTodosDados(nome, email, senha, confSenha) {
        cy.get(this.inputNomeUsuario).type(nome);
        cy.get(this.inputEmailUsuario).type(email);
        cy.get(this.inputSenha).type(senha);
        cy.get(this.inputConfSenha).type(confSenha);
    }

    registrarUsuario() {
        cy.get(this.buttonRegistrar).click();
    }

    preencherDadosSemNome(email, senha, confSenha) {
        cy.get(this.inputEmailUsuario).type(email);
        cy.get(this.inputSenha).type(senha);
        cy.get(this.inputConfSenha).type(confSenha);
    }

    preencherDadosSemEmail(nome, senha, confSenha) {
        cy.get(this.inputNomeUsuario).type(nome);
        cy.get(this.inputSenha).type(senha);
        cy.get(this.inputConfSenha).type(confSenha);
    }

    preencherDadosSemSenha(nome, email, confSenha) {
        cy.get(this.inputNomeUsuario).type(nome);
        cy.get(this.inputEmailUsuario).type(email);
        cy.get(this.inputConfSenha).type(confSenha);
    }

    preencherDadosSemConfSenha(nome, email, senha) {
        cy.get(this.inputNomeUsuario).type(nome);
        cy.get(this.inputEmailUsuario).type(email);
        cy.get(this.inputSenha).type(senha);
    }

    clicarIconeOlhoSenha() {
        cy.get(this.iconOlho).eq(0).click();
    }

    testeAtributoSenha() {
        cy.get(this.inputSenha).invoke("attr", "type").should("eq", "text");
    }

    clicarIconeOlhoConfSenha() {
        cy.get(this.iconOlho).eq(1).click();
    }

    testeAtributoConfSenha() {
        cy.get(this.inputConfSenha).invoke("attr", "type").should("eq", "text");
    }

    voltarTelaLogin() {
        cy.get(this.buttonVoltar).click();
    }

}

export var criarPage = new CriarPage();