# Academy-trabalho-final-grupo-da-Elma-Chips

##  Sobre o projeto

📋 O Sistema Lembra Compras é ser uma aplicação que auxilia seus usuários a lembrarem de produtos a serem comprados durante a ida à comércios do dia à dia, como supermercados, padarias, mercearias, etc.

Os usuários podem se cadastrar para ter acesso a aplicação, o que permite cadastrar suas listas e, posteriormente, consultar as compras que já foram feitas anteriormente, permitindo controle e reutilização destas informaçõs para a elaboração de listas futuras.

---

##  Documentação
A documentação da api pode ser encontrada no swagger neste [link](https://lista-compras-api.herokuapp.com/api-docs/)

O site Lembra Compras pode ser acessado através desse [link](https://academy-lembra-compras.herokuapp.com/login)

---

## Funcionalidades e critérios de aceite utilizados

### Criar usuário
  #### Como uma pessoa qualquer
  #### Desejo me registrar no sistema
  #### Para ter acesso as funcionalidades de lista de compras
  
- As informações necessárias para cadastrar um usuário são: nome, email e senha;
- No processo de cadastro, o usuário deve ser solicitado para realizar a confirmação da senha. Se a senha não for confirmada, não deve ser possível concluir o cadastro;
- O formato aceito de e-mail segue o padrão nomeUtilizador@dominio.
  - Exemplo: nome@email.com.
  - Se o e-mail informado possuir um formato inválido, a operação de registro deverá ser cancelada;
- Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário;
- Se houver a tentativa de cadastrar um usuário com e-mail já existente, o processo deverá ser bloqueado com a mensagem: User already exists.;
- Não deve ser possível cadastrar um nome com mais de 100 caracteres;
- Não deve ser possível cadastrar um e-mail com mais de 60 caracteres.

### Login
  #### Como um usuário com conta no sistema
  #### Desejo realizar meu acesso na aplicação
  #### Para conseguir utilizar os serviços do Lembra Compras.	
  
- O login deve ser feito utilizando informações de email e senha do cadastro de usuário.
- Caso o email e senha utilizado no login coincidam com o cadastrado na base de dados, o usuário deve ser autenticado e deve ter acesso às demais funcionalidades.
- Caso o email ou senha utilizado no login não coincidam com o cadastrado na base de dados, a operação de login deve ser recusada.

### Perfil
  #### Como um usuário com conta no sistema
  #### Desejo atualizar minhas informações básicas
  #### Para manter meus dados atualizados no sistema.
  
- O cliente precisa estar logado para realizar a atualização de suas informações.
- O cliente deve ser capaz de atualizar apenas seu próprio nome e email.
- O novo email do cliente não deve coincidir com um email já utilizado por outro usuário.
- Não deve ser possível atualizar o nome para que tenha mais de 100 caracteres.
- Não deve ser possível atualizar o e-mail para que tenha mais de 60 caracteres.

### Gestão de lista de compras
  #### Como um usuário com conta no sistema
  #### Desejo gerenciar uma lista de compras
  #### Para registrar os produtos que desejo comprar.	
  
- Apenas usuários logados podem criar uma lista;
- Só deve ser possível possuir uma lista ativa por vez;
- As listas devem ser compostas por uma descrição e por uma lista de itens que identificam os produtos a serem comprados;
- Os itens da lista possuem apenas nome e quantidade;
- Deve ser possível criar uma lista sem descrição, dado que pelo menos um item tenha sido adicionado;
- A quantidade mínima de um item na lista deve ser de 1 unidade;
- A quantidade máxima de um item na lista deve ser de 1000 unidades.
- Se um item que já existe na lista sofrer uma nova tentativa de ser adicionado utilizando o mesmo nome, a quantidade do item deve ser acrescentada;
- Ao atualizar a quantidade do item, a nova quantidade total atualizada deste item não deve ultrapassar de 1000 unidades;
- O usuário deve poder marcar um item como concluído;
- O usuário pode finalizar a lista de compras. O status da lista não pode ser alterado após ter sido finalizada;

### Histórico de lista de compras
  #### Como um usuário com conta no sistema
  #### Desejo consultar minhas últimas listas de compra
  #### Para visualizar minhas últimas compras
  
- O usuário só deve visualizar as suas próprias listas;
- O usuário precisa estar logado para visualizar seu histórico;
- Apenas as últimas 10 listas mais recentes devem ser listadas no histórico;
- O nome da lista e data de criação da mesma devem ser listados para o usuário;
- Deve ser possível consultar o nome e itens de uma lista após interagir com a lista no Histórico.

---

## Como executar o projeto

Este projeto está implementado nos Frameworks Karate e Cypress.
É bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)

### Pré-requisitos para executar o Karate Framework

O Karate Framework é uma ferramenta de testes, podendo ser utilizado para testes de API.
O Karate framework possibilita que testes sejam escritos de maneira natural e com uma configuração simples, que não exige muito conhecimento de linguagens ou lógica de programação.

#### Java
O Karate é compilado em Java, por isso temos que baixar o Java [Download](https://www.oracle.com/br/java/technologies/javase/javase8-archive-downloads.html)

##### Configuração de variáveis de ambiente no Windows
1. Acesse o menu de pesquisa do Windows;
2. Pesquise por Variáveis de ambiente;
3. Acesse a opção Editar Variáveis de ambiente do sistema;
4. No canto inferior direito, acesse Variáveis de ambiente;
5. Em Variáveis do sistema, clique em Novo;
6. No campo Nome da variável, insira JAVA_HOME;
7. No campo Valor da variável, insira o seu caminho de instalação do Java/jdk.
8. No campo Nome da variável, insira JAVA_JRE;
9. No campo Valor da variável, insira o seu caminho de instalação do Java/jre.
9. Em Variáveis de usuário, localize a variável Path;
10. Clique em Editar;
11. Clique em Novo para adicionar uma nova linha;
12. Acrescente na nova linha o seguinte: %JAVA_HOME%\bin

##### Standalone Karate Framework
1. Acesse a página de [Releases do karate](https://github.com/karatelabs/karate/releases)
2. Procure pela última release (versão) disponível contendo a tag Latest
3. Acesse a grade de Assets;
4. Faça download do arquivo karate-*.*.*.jar.

### Pré-requisitos para executar o Karate Framework
 O Cpress é uma ferramenta de testes, podendo ser utilizado para testes de Front-End
  
#### Node.js
O NodeJS é um runtime do JavaScript e permite a execução do JavaScript fora do ambiente Web, por isso temos que baixar o [NodeJS](https://nodejs.org/en/download/)

### Executando o Karate Framework
- Abrindo os arquivos do Git Hub com o VSCode, abra o terminal direcionando para a pasta Karate. 
- No terminal digite "java -jar karate.jar *.feature".
- Observação: O "*" significa a feature que o Karate irá executar. Se colocar exatamente o "*" o Karate irá executar todos os testes de uma só vez. Exemplo: java -jar karate.jar criarUsuario.feature; Esse código irá executar todos os testes do arquivo criarUsuario.feature

### Executando o Cypress
- Abrindo os arquivos do Git Hub com o VSCode, abra o terminal direcionado para a pasta Cypress. Atente-se o nome da pasta Cypress com "C" maiusculo, se direcionar o terminal para alguma outra pasta, o Cypress será instalado nessa outra pasta.
- No terminal digite "npm install".
- Após a instalação da pasta node_modules, digite no terminal "npx cypress open", está ação irá abriar o Cypress, selecione o arquivo .feature que você queira executar os testes.

## 🦸 Autores

-   **[Ariana Sarquis](https://github.com/arianasarquis)**
-   **[Davidson Magalhães](https://github.com/davidsonmss)**
-   **[Dionatan da Rosa](https://github.com/Dionatan-r)**
-   **[Gabrielle Paiva](https://github.com/gabpvs)**
-   **[Vitor Galinari](https://github.com/VasgBR)**

---
