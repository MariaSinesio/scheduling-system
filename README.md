## 🖥️ app-agendamento-treinamento

### Visão Geral

O ***app-agendamento-treinamento*** é uma aplicação em Ruby on Rails projetada para gerenciar agendamentos de forma eficiente. O sistema permite que os usuários se cadastrem, gerenciem seus perfis e também os de seus dependentes, facilitando a marcação de compromissos para toda a família em um só lugar. Este projeto utiliza Ruby on Rails como framework principal, MySQL como banco de dados e Devise para autenticação de usuários.

#### Como Executar o Projeto

Para testar este projeto em seu ambiente local, siga os passos abaixo.

Pré-requisitos:

    Ruby (versão recomendada no .ruby-version)

    Bundler

    Rails

    PostgreSQL
[¹]:Os passos foram pensados para terminal Bash.

Passos: 

    
    git clone https://github.com/beep-saude/app-agendamento-treinamento.git
    cd scheduling-system




Instale as dependências:

````
bundle install
````

Configure o banco de dados:
Certifique-se de que seu PostgreSQL está em *execução*. Em seguida, crie e migre o banco de dados.

````
rails db:create
rails db:migrate
````

Inicie o servidor:

    rails s

Agora, você pode acessar a aplicação em seu navegador através do endereço http://localhost:3000.
