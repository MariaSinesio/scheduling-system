## 🖥️ Scheduling System

### Visão Geral

O ***Scheduling System*** é uma aplicação em Ruby on Rails projetada para _gerenciar agendamentos de forma eficiente_. O sistema permite que os usuários se cadastrem, gerenciem seus perfis e também os de seus dependentes, facilitando a marcação de compromissos para toda a família em um só lugar. Este projeto utiliza _Ruby on Rails_ como framework principal, _MySQL_ como banco de dados e _Devise_ para autenticação de usuários

#### Como Executar o Projeto

Para testar este projeto em seu ambiente local, siga os passos abaixo.

Pré-requisitos:

    Ruby (versão recomendada no .ruby-version)

    Bundler

    Rails

    Mysql

[¹]:Os passos foram pensados para terminal Bash.

Passos: 

    
    git clone https://github.com/MariaSinesio/scheduling-system.git
    cd scheduling-system




Instale as dependências:

````
bundle install
````

Configure o banco de dados:
Certifique-se de que seu MySQL está em *execução*. Em seguida, crie e migre o banco de dados.

````
rails db:create
rails db:migrate
````

Inicie o servidor:

    rails s

Agora, você pode acessar a aplicação em seu navegador através do endereço http://localhost:3000.

#### Etapas do Fluxo de Agendamento

1. Registro Inicial

Para utilizar o sistema, o usuário deve realizar um cadastro inicial fornecendo as seguintes informações:


  - *Dados Pessoais: Nome completo, CPF, data de nascimento e gênero.*
    
  - *Endereço: Endereço completo com CEP (É desejável possuir uma função de preenchimento automático para rua, bairro, cidade e estado), número e complemento.*
    
  - *Contato: Telefone celular e e-mail.*

    
2. Validação de Dados

Garantir validações robustas através de:

  - *CPF: O formato é validado para assegurar que contenha 11 dígitos numéricos e seja um número de CPF válido.*

  - *E-mail: O formato do e-mail é verificado para garantir que siga um padrão válido (ex: usuario@dominio.com).* 

3. Senha Segura

A segurança da conta é reforçada por requisitos de complexidade para a senha, que deve conter:

  - *No mínimo 8 caracteres.*

  - *Combinação de letras maiúsculas e minúsculas.*

  - *Pelo menos um número.*

  - *Pelo menos um caractere especial (ex: !, @, #, $).*

4. Gerenciamento de Dependentes

Após o cadastro, o usuário principal pode adicionar e gerenciar perfis de dependentes (como filhos ou idosos). Cada dependente possui um cadastro com as mesmas informações básicas do titular, permitindo que o usuário principal realize agendamentos em nome deles de forma simples e centralizada.
