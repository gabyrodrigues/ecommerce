<h3 align="center" >
	<img alt="Logo" title="#logo" width="300px" src="app/assets/images/logo.png/">
    	<br><br>
  	Projeto criado para a disciplina de Programação Web I do semestre letivo 2020.1 ministrada pelo professor Leonardo Moreira do curso de Sistemas e Mídias Digitais na Universidade Federal do Ceará.
</h3>
<p align="center">
	É possível encontrar a modelagem do projeto no <a href="https://drive.google.com/file/d/1G_oSNJrB3PAhGBZq-6mb9ZOjBh3v7leG/view?usp=sharing" target="_blank">Draw.io</a>
</p>

<p align="center">
  <img alt="Languagues" src="https://img.shields.io/github/languages/count/gabyrodrigues/ecommerce">
  <img alt="Top Languague" src="https://img.shields.io/github/languages/top/gabyrodrigues/ecommerce">
  <img alt="Repository size" src="https://img.shields.io/github/repo-size/gabyrodrigues/ecommerce">
  <a href="https://github.com/gabyrodrigues/ecommerce/commits/master">
    <img alt="Last commit date" src="https://img.shields.io/github/last-commit/gabyrodrigues/ecommerce">
  </a>
  <a href="https://github.com/gabyrodrigues" target="_blank">
    <img alt="Desenvolvido por Gabriely Rodrigues" src="https://img.shields.io/badge/developed%20by-Gabriely_Rodrigues-informational">
  </a>
</p>

## :computer: Linguagens utilizadas

- **Javascript**
- **Ruby on Rails**
- **HTML**
- **CSS/SASS**
- **SQL**

## :rocket: Executando a aplicação

- ### **Pré-requisitos**

  - Ruby versão 2.7.1
  - Rails versão 6.0.3.2
  - PostgresSQL
  
 <i>Caso você não possua os pré-requisitos, é possível acessar o site do <a href="https://gorails.com/setup/ubuntu/16.04">Gorails</a> e seguir os passos para a instalação</i>

1. Clone a aplicação:

```
git@github.com:gabyrodrigues/ecommerce.git
```

2. Preparando o Banco de dados:
```rake db:migrate```

- Também é possível criar uma database no PostgreSQL chamada dev e nela um schema chamado ecommerce. Caso ache necessário alterar esse passo basta acessar o arquivo database.yml e alterar as informações de nomenclatura e configuração do banco. 

Com a aplicação clonada e com o banco criado, o próximo passo é entrar no terminal na pasta da aplicação e seguir para os próximo passos:

3. Instalando as dependências do projeto:

```
  # Instalando as dependencias
  $ bundle install
```

Com esse comando, todas a lista de dependências necessárias para o projeto funcionar são instaladas. 

4. Migrando o banco de dados:
```
  ## Criando as tabelas do banco de dados no schema definido no database.yml, no caso padrão, o nome do schema no banco é ecommerce
  $ rails db:migrate
```

5. Criando os registros no banco de dados:
```
  ## Ao rodar o arquivo seed, os registros de um usuário administrador são criados, sendo mais fácil para acessar todas as funcionalidades no sistema
  $ rails db:seed
```

6. Subindo o servidor local:
```
  ## Após rodar esse comando, a aplicação já estará pronta para ser acessada em http://localhost:3000/
  $ rails s
```


Desenvolvido por [Gabriely Rodrigues](https://github.com/gabyrodrigues)
