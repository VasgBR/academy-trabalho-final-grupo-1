Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: acesso a pagina do perfil 
        Given que estou logado
        When vou em perfil

        Scenario: atualizar perfil com sucesso
            And atualizo o e-mail
            | nome completo | Davidson Santana |
            | e-mail        | pimpo@g.com      |
            And clico em Confirmar alterações 
            And clico em Confirmar 
            Then visualizo a mensagem
            | mensagem | Informações atualizadas com sucesso! |

        Scenario: não pode atualizar os campos identificador e tipo de conta 
            And clico em identificador 
            And clico em Tipo de conta 
            Then não é possível editar o campo

        Scenario: novo e-mail não pode ser existente 
            And insiro um email já cadastrado 
            | e-mail | vitor@galinari.com |
            And clico em Confirmar alterações 
            And clico em Confirmar 
            Then o site retorna a mensagem 
            | mensagem | Este e-mail já é utilizado por outro usuário. |

        Scenario: o campo nome completo não pode ter mais de 100 caracteres
            And digito no campo nome completo 101 caracteres
            | Nome completo | Davidson SantanaDavidson SantanaDavidson SantanaDavidson SantanaDavidson SantanaDavidson SantanaDavidson Santana |
            Then o site retorna a mensagem 
            And clico em Confirmar alterações
            | mensagem | Informe no máximo 100 letras no seu nome |

        Scenario: o campo email não pode ter mais de 60 caracteres
            And digito no campo email 61 caracteres
            | e-mail | pimpopimpopimpopimpopimpopimpopimpopimpopimpopimpopimpopimpopimpopimpopimpopimpo@h.com |  
            Then o site devolve uma mensagem
            And clico em Confirmar alterações 
            | mensagem |  Informe no máximo 60 letras no seu e-mail |

        Scenario: o nome deve conter no mínimo 4 letras
            And digito no campo nome completo 
            | Nome completo | Dav |
            And clico em Confirmar alterações 
            And clico em Confirmar 
            Then vejo a mensagem 
            | mensagem | Informe seu nome completo |

        Scenario: inserindo email inválido 
            And digito um email inválido
            | e-mail | pimpo.com |
            And clico em Confirmar alterações 
            And clico em Confirmar 
            Then o site retorna a mensagem 
            | mensagem | Formato de e-mail inválido. |
            

    