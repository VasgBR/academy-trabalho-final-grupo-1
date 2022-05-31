class LoginPage {
   
    inputEmailUsuario = "[name='email']";
    inputSenha = "[name='password']";
    buttonEntrar = "button.jmKUXo";
    buttonVoltar = ".sc-crXcEl";
    inputSenha = "[name='password']";
    inputConfSenha = "[name='confirmPassword']";
    inputNomeUsuario = "[name='name']";
    tresBarrinhas = '.bgBaRw'
    buttonRegistrese = "[href='/register']";
    buttonRegistrarPagLogin = "button.sc-ftvSup";



    preencherDadosCadastros(nome, email, senha, confSenha) {
        cy.visit("/register");
        cy.get(this.inputNomeUsuario).type(nome);
        cy.get(this.inputEmailUsuario).type(email);
        cy.get(this.inputSenha).type(senha);
        cy.get(this.inputConfSenha).type(confSenha);
        cy.get(this.buttonRegistrarPagLogin).click();
    }

    preencherTodosDados(email, senha) {
        cy.get(this.inputEmailUsuario).type(email);
        cy.get(this.inputSenha).type(senha);
    }

    loginUsuario() {
        cy.get(this.buttonEntrar).click();
    }

    preencherDadosSemEmail(senha) {
        cy.get(this.inputSenha).type(senha);
    }

    preencherDadosSemSenha(email) {
        cy.get(this.inputEmailUsuario).type(email);
    }

    verificarUrlLogin() {
        cy.url().should("eq", "https://academy-lembra-compras.herokuapp.com/login")
    }

    verificarUrlRegistro() {
        cy.url().should("eq", "https://academy-lembra-compras.herokuapp.com/register")
    }

    verificarUrlLista() {
        cy.url().should("eq", "https://academy-lembra-compras.herokuapp.com/lista")
    }

    visitarLogin() {
        cy.visit("/login");
    }

    clicarBotaoRegistrese() {
        cy.get(this.buttonRegistrese).click(); 
    }

    logout() {
        cy.get(this.tresBarrinhas).click({force: true});
        cy.contains('Sair').click({force: true});
    }
}

export var loginPage = new LoginPage();