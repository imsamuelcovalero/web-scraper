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
    - [Testes](#testes)
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

Renomeie o arquivo `.env.example` para `.env` e atualize as variáveis de ambiente de acordo com o seu ambiente de desenvolvimento:

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

1. **Padrão: Raspar e salvar no banco MySQL** - Esta opção extrai dados de laptops Lenovo do site de e-commerce e os armazena no banco de dados MySQL. Os dados coletados podem ser utilizados para diversas análises e integrações.
2. **Gerar arquivo SQL proveniente do banco MySQL** - Selecionando esta opção, um arquivo `lenovo_laptops.sql` será gerado, contendo os comandos SQL para recriar os dados raspados em outro banco de dados MySQL. Este arquivo pode ser utilizado para migração, backup ou qualquer outra operação que exija a restauração dos dados em um novo ambiente.
3. **Gerar arquivo JSON a partir do banco MySQL** - Esta opção permite a exportação dos dados do banco de dados MySQL para um arquivo `lenovo-laptops.json`. Este formato é amplamente utilizado para a troca de dados entre servidores e aplicações web, sendo também útil para análises e operações que requerem um formato de dados mais flexível.
4. **Gerar ambos os arquivos a partir do banco MySQL** - Esta opção realiza a geração dos arquivos `lenovo_laptops.sql` e `lenovo-laptops.json`, permitindo que você tenha tanto o backup completo do banco de dados quanto uma representação dos dados em um formato amplamente compatível para uso em diversas aplicações.
5. **Gerar arquivo JSON diretamente pela raspagem (sem banco de dados)** - Escolha esta opção para gerar um arquivo `lenovo-laptops.json` diretamente a partir da raspagem de dados, sem a necessidade de armazenamento intermediário em um banco de dados. Isso é ideal para situações em que a persistência de dados não é necessária ou quando se deseja trabalhar com os dados de maneira imediata.
6. **Cancelar** - Use esta opção para sair do script e encerrar a execução do programa.

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
├── tests
|   ├── ...
├── .env.example
├── createDatabase.js
├── docker-compose.yaml
├── lenovo_laptops.sql *
├── lenovo-laptops.json *
├── package.json
├── script.js
└── ...
```

**Nota: Os arquivos `lenovo_laptops.sql` e `lenovo-laptops.json` são criados apenas quando determinadas ações de exportação de dados são realizadas pelo usuário. Eles não são incluídos por padrão no repositório e serão encontrados na raiz do projeto somente após a execução dos comandos relevantes do `script`.*

### Arquivos

- **src:** Contém os arquivos-fonte da aplicação.
  - **database:** Contém os arquivos relacionados ao banco de dados.
    - **models:** Contém os modelos de dados utilizados pela aplicação.
    - **config:** Contém o arquivo de configuração do banco de dados.
  - **scraperFunctions.js:** Contém as funções de raspagem de dados.
- **.env.example:** Contém um exemplo do arquivo `.env` utilizado para armazenar as variáveis de ambiente.
- **createDatabase.js:** Contém o script para criação do banco de dados.
- **docker-compose.yaml:** Contém a configuração do banco de dados MySQL para uso com `Docker Compose`.
- **lenovo_laptops.sql:** Contém os comandos SQL para recriar os dados raspados em outro banco de dados MySQL.
- **lenovo-laptops.json:** Contém os dados raspados em formato `JSON`.
- **package.json:** Contém as informações do projeto e as dependências da aplicação e os `scripts` de execução.
- **script.js:** Contém o script principal da aplicação.

### Tecnologias e Ferramentas Utilizadas

- [**Node.js**](https://nodejs.org): Ambiente de execução para `JavaScript`. Escolhido por sua eficiência e vasta comunidade de apoio, `Node.js` é o ambiente de execução ideal para desenvolvimento `JavaScript` do lado do servidor.
- [**Puppeteer**](https://pptr.dev/): Biblioteca para controle de navegador *headless*. Utilizei o `Puppeteer` pela sua capacidade de automatizar ações em navegadores de forma *headless*, permitindo a raspagem de dados de forma eficiente.
- [**MySQL**](https://www.mysql.com/): Sistema de gerenciamento de banco de dados. Optei pelo `MySQL` devido à sua robustez, escalabilidade e facilidade de uso como sistema de gerenciamento de banco de dados.
- [**Sequelize**](https://sequelize.org/): `ORM` para `Node.js`. Escolhido por ser um `ORM` poderoso, o que facilita a escrita de consultas de banco de dados de forma segura e mantém nosso código limpo e fácil de manter.
- [**Inquirer.js**](https://www.npmjs.com/package/inquirer): Biblioteca para *interface* de linha de comando interativa. `Inquirer.js` torna as interações de linha de comando simples e intuitivas, melhorando a experiência do usuário ao executar o *script*.
- [**Jest**](https://jestjs.io/): `Framework` de testes em `JavaScript`. `Jest` é um `framework` de testes completo e de fácil configuração, que oferece funcionalidades como *mock*, cobertura de código e isolamento de teste, sendo a escolha perfeita para garantir a qualidade do código.
- [**ESLint**](https://eslint.org/): Ferramenta de análise de código para identificar padrões problemáticos encontrados no código `JavaScript`. `ESLint` ajuda a manter o código alinhado com as melhores práticas e padrões da indústria, além de identificar problemas antes que eles se tornem críticos, o que é essencial para a manutenção a longo prazo do projeto.

### Testes

Para executar os testes da aplicação, use o comando:

```bash
npm test
```

Os testes foram desenvolvidos utilizando o `framework` [Jest](https://jestjs.io/) e são projetados para validar as funcionalidades críticas da aplicação. Eles podem ser encontrados no diretório `__tests__` e seu propósito é garantir que a aplicação funcione corretamente e que as alterações feitas no código não quebrem as funcionalidades existentes.

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
