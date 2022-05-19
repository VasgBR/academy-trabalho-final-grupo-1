Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Acessar o site e fazer o login
        Given acesso o site Lembra Compras
        And faço login no site
        | email | galinarigame@gmail.com |
        | senha | Vasg1410               |

        Scenario: Remover um item da lista
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 2 |
            And clico no símbolo +
            And clico no símbolo de Lixeira
            Then removo um item da lista

        Scenario: Criar uma lista de compras
            When dou um nome para minha lista
            | nomeLista | Compras para a ceia de natal |
            And informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 2 |
            And clico no botão +
            And eu adiciono um produto a lista
            And clico no botão Salvar
            Then visualizo a mensagem de sucesso
            | mensagem | Lista de compras criada com sucesso! |

        Scenario: Tachar itens na lista
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 2 |
            And clico no botão +
            And clico no botão Salvar
            And marco a caixa de seleção do item na lista
            Then o item é tachado

        Scenario: Finalizar a lista
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 2 |
            And clico no botão +
            And clico no botão Salvar
            And clico no botão Finalizar a lista
            And clico no botão Confirmar
            Then visualizo a mensagem de sucesso
            | mensagem | Lista concluída com sucesso! |
