class LoginPage {
   
    inputEmailUsuario = "[name='email']";
    inputSenha = "[name='password']";
    buttonEntrar = "button.sc-ftvSup";
    buttonRegistrar = ".sc-crXcEl";

    visitarLogin() {
        cy.visit("login");
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
}

export var loginPage = new LoginPage();