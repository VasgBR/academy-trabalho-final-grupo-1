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

        Scenario: Criar uma lista de compras sem descrição
            And informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 2 |
            And clico no botão +
            And eu adiciono um produto a lista
            And clico no botão Salvar
            Then visualizo a mensagem de sucesso
            | mensagem | Lista de compras criada com sucesso! |

        Scenario: Criar uma lista de compras sem nenhum item
            When dou um nome para minha lista
            | nomeLista | Compras para a ceia de natal |
            And clico no botão Salvar
            Then visualizo a mensagem de erro
            | mensagem | Adicione pelo menos um item na sua lista de compras |

        Scenario: Adicionar item na lista com quantidade menor que 1
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 0 |
            And clico no botão +
            Then visualizo a mensagem de erro
            | mensagem | Informe pelo menos 1 unidade |

        Scenario: Adicionar item na lista com quantidade maior que 1000
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 1001 |
            And clico no botão +
            Then visualizo a mensagem de erro
            | mensagem | Informe uma quantidade menor ou igual a 1000 |

        Scenario: Aumentar a quantidade dos produtos já adicionados na lista
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 1 |
            And clico no botão +
            And informo o nome do mesmo produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 1 |
            And clico no botão +
            Then o sistema deve aumentar a quantidade do produto listado

        Scenario: Aumentar a quantidade dos produtos já adicionados na lista para ter uma quantidade maior que 1000
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 1000 |
            And clico no botão +
            And informo o nome do mesmo produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 1 |
            And clico no botão +
            Then visualizo a mensagem de erro
            | mensagem | Não é permitido incluir mais de 1000 unidades do produto. |

        Scenario: Cancelar a opção de Finalizar a lista
            When informo o nome do produto
            | nomeProduto | Arroz pct 1kg |
            And informo a quantidade de produtos
            | quantidade | 2 |
            And clico no botão +
            And clico no botão Salvar
            And clico no botão Finalizar a lista
            And clico no botão X
            Then volto para a lista

        Scenario: Clicar no nome da página
            Given não estou na aba de lista
            When clico no Lembra Compras
            Then sou direcionado para a aba de lista

        Scenario: Clicar no ícone principal que é um R
            Given não estou na aba de lista
            When clico no ícone principal
            Then sou direcionado para a aba de lista