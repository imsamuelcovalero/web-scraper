# Raspagem e Armazenamento de Dados de Laptops

O projeto **Raspagem e Armazenamento de Dados de Laptops** é uma aplicação desenvolvida para raspar dados de *laptops* Lenovo de um website de *e-commerce* de exemplo, armazená-los em um banco de dados `MySQL` e gerar arquivos `JSON` e `SQL` a partir desses dados.

## Sumário

- [Raspagem e Armazenamento de Dados de Laptops](#raspagem-e-armazenamento-de-dados-de-laptops)
  - [Sumário](#sumário)
  - [Visualização](#visualização)
  - [Contexto](#contexto)
    - [Funcionalidades](#funcionalidades)
  - [Como Rodar a Aplicação](#como-rodar-a-aplicação)
    - [Pré-requisitos](#pré-requisitos)
    - [Configuração](#configuração)
    - [Execução](#execução)
  - [Detalhes Técnicos](#detalhes-técnicos)
    - [Estrutura do Projeto](#estrutura-do-projeto)
    - [Arquivos](#arquivos)
    - [Tecnologias e Ferramentas Utilizadas](#tecnologias-e-ferramentas-utilizadas)
    - [Lint](#lint)
  - [Notas](#notas)
    - [Git, GitHub e Histórico de Commits](#git-github-e-histórico-de-commits)
    - [Problemas e Soluções](#problemas-e-soluções)

## Visualização

<div align="center">

![Web Scraper](https://github.com/imsamuelcovalero/web-scraper/assets/98184355/d5443311-164d-4316-aafb-04cfb23deab8)

</div>

## Contexto

Este projeto utiliza técnicas de raspagem de dados para extrair informações de *laptops* da marca Lenovo de um site de *e-commerce*. Os dados são salvos em um banco de dados `MySQL` e podem ser exportados para arquivos `JSON` e `SQL` para análise e uso posterior.

### Funcionalidades

- **Raspagem de Dados:** Extrai informações de *laptops*, incluindo título, descrição e opções de HDD, de um *website* de *e-commerce*.
- **Armazenamento em Banco de Dados:** Salva os dados raspados em um banco de dados `MySQL`.
- **Exportação de Dados:** Gera arquivos `JSON` e `SQL` a partir dos dados armazenados no banco de dados.

## Como Rodar a Aplicação

### Pré-requisitos

- **Node.js**
- **MySQL**
- **Git** (para clonar o repositório)

### Configuração

Clone o repositório:

```bash
git clone git@github.com:imsamuelcovalero/web-scraper.git
```

Acesse o diretório do projeto e instale as dependências:

```bash
cd web-scraper
npm install
```

Configure o banco de dados MySQL e atualize o arquivo `.env` com as informações de conexão. Tanto o `docker-compose.yaml` quanto o arquivo `database.js` estão esperando usar as variáveis de ambiente definidas no arquivo `.env`.

Crie um arquivo `.env` na raiz do projeto com o seguinte conteúdo, substituindo os valores conforme necessário:

```bash
APP_PORT=3000 # Porta para o servidor escutar (padrão: 3000)
MYSQL_USER=root # Nome de usuário do MySQL (padrão: root)
MYSQL_PASSWORD=sua_senha # Senha do MySQL
MYSQL_DB=web-scraper-db # Nome do banco de dados MySQL
MYSQL_HOST=localhost # Host do MySQL (padrão: localhost)
MYSQL_PORT=3306 # Porta do MySQL (padrão: 3306)
```

Para iniciar o serviço do banco de dados `MySQL` utilizando o `docker-compose`, execute o seguinte comando:

```bash
docker-compose up -d
```

Este comando irá iniciar o serviço do banco de dados em um container `Docker`, facilitando a configuração e execução do serviço do `MySQL`.

### Execução

Para iniciar o processo de raspagem e armazenamento de dados, execute o seguinte comando:

```bash
npm start
```

Após a execução do comando, você será apresentado com um menu interativo com as seguintes opções:

1. **Padrão: Raspar e salvar no banco MySQL** - Esta opção extrai dados de laptops Lenovo do site de e-commerce e os armazena em um banco de dados MySQL, que é um sistema de gerenciamento de banco de dados usado para organizar e armazenar dados.
2. **Gerar arquivo SQL proveniente do banco MySQL** - Selecionando esta opção, um arquivo SQL será gerado. SQL (Linguagem de Consulta Estruturada) é usado para comunicar com e manipular bancos de dados. O arquivo SQL contém comandos que podem ser usados para recriar os dados em outro banco de dados MySQL.
3. **Gerar arquivo JSON a partir do banco MySQL** - Esta opção permite exportar os dados do banco de dados MySQL para um arquivo JSON. JSON (JavaScript Object Notation) é um formato leve de troca de dados, fácil de ler e escrever para humanos, e fácil de analisar e gerar por máquinas.
4. **Gerar ambos os arquivos a partir do banco MySQL** - Esta opção realiza ambas as tarefas de geração de arquivos JSON e SQL a partir do banco de dados.
5. **Gerar arquivo JSON diretamente pela raspagem (sem banco de dados)** - Escolha esta opção para raspar os dados e salvá-los diretamente em um arquivo JSON, sem a necessidade de armazenamento em um banco de dados. É útil para casos de uso simples onde o armazenamento em banco de dados não é necessário.
6. **Cancelar** - Use esta opção para sair do script.

Siga as instruções na tela para selecionar a opção desejada e proceder com a raspagem e o armazenamento de dados.

## Detalhes Técnicos

### Estrutura do Projeto

```lua
.
├── src
│   ├── database
│   │   ├── config
│   │       └── database.js
│   │   └── models
│   │       └── HddOption.js
│   │       └── Laptop.js
│   ├── scraperFunctions.js
│   └── ...
├── .env.example
├── createDatabase.js
├── docker-compose.yaml
├── package.json
├── script.js
└── ...
```

### Arquivos

- **src:** Contém os arquivos-fonte da aplicação.
  - **database:** Contém os arquivos relacionados ao banco de dados.
    - **models:** Contém os modelos de dados utilizados pela aplicação.
    - **config:** Contém o arquivo de configuração do banco de dados.
  - **scraperFunctions.js:** Contém as funções de raspagem de dados.
- **.env.example:** Contém um exemplo do arquivo `.env` utilizado para armazenar as variáveis de ambiente.
- **createDatabase.js:** Contém o script para criação do banco de dados.
- **docker-compose.yaml:** Contém a configuração do banco de dados MySQL para uso com `Docker Compose`.
- **package.json:** Contém as informações do projeto e as dependências da aplicação e os `scripts` de execução.
- **script.js:** Contém o script principal da aplicação.

### Tecnologias e Ferramentas Utilizadas

- [**Node.js**](https://nodejs.org): Ambiente de execução para `JavaScript`.
- [**Puppeteer**](https://pptr.dev/): Biblioteca para controle de navegador *headless*.
- [**MySQL**](https://www.mysql.com/): Sistema de gerenciamento de banco de dados.
- [**Sequelize**](https://sequelize.org/): `ORM` para `Node.js`.
- [**Inquirer.js**](https://www.npmjs.com/package/inquirer): Biblioteca para interface de linha de comando interativa.

### Lint

Para verificar a qualidade do código com o `linter`, use o comando:

```bash
npm run lint
```

Este projeto foi desenvolvido seguindo os padrões de código JavaScript com o uso do [ESLint](https://eslint.org/), utilizando a configuração do [Airbnb](https://github.com/airbnb/javascript) e algumas regras personalizadas para promover um código limpo e bem estruturado.

## Notas

### Git, GitHub e Histórico de Commits

Este projeto utiliza a [Especificação de Commits Convencionais](https://www.conventionalcommits.org/en/v1.0.0/), com alguns tipos da [convenção Angular](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines). Além disso, foi utilizado o pacote [conventional-commit-cli](https://www.npmjs.com/package/conventional-commit-cli).

Durante o desenvolvimento da aplicação, utilizei o `Git` como ferramenta de controle de versão e o `GitHub` como plataforma de hospedagem, seguindo o padrão [Gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow). A `branch develop` foi o principal local de desenvolvimento, e suas mudanças foram periodicamente mescladas à `branch main` através de pull requests, seguindo um processo cuidadoso de revisão e integração.

### Problemas e Soluções

É importante lembrar que, ao encontrar problemas durante a instalação ou execução, uma boa prática é verificar as mensagens de erro que aparecem no terminal. Elas geralmente fornecem pistas sobre o que pode estar errado. Também é recomendável manter todas as dependências atualizadas e garantir que seu ambiente de desenvolvimento esteja configurado corretamente. Além disso, é aconselhável consultar a documentação oficial das dependências usadas no projeto em caso de problemas.

Em caso de dúvidas, não hesite em abrir uma [issue](https://github.com/imsamuelcovalero/web-scraper/issues) no GitHub ou me contatar diretamente. Estou à disposição para ajudar.

Espero que estas instruções sejam úteis para a instalação e execução do projeto. Se houver mais alguma coisa em que eu possa ajudar, por favor, me avise.

[⬆ Voltar ao topo](#sumário)
