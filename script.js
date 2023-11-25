// Função autoexecutável para usar importações modernas e async/await
(async () => {
  // Importação das dependências
  const inquirer = await import('inquirer');
  // Importação das funções do scraper
  // eslint-disable-next-line import/extensions
  const scraperFunctions = await import('./src/scraperFunctions.js');

  // Função para executar a ação escolhida pelo usuário
  async function executeOption(option) {
    switch (option) {
      case '1':
        await scraperFunctions.scrapeAndSave();
        break;
      case '2':
        await scraperFunctions.generateSQL();
        break;
      case '3':
        await scraperFunctions.exportMySQLtoJSON();
        break;
      case '4':
        await scraperFunctions.exportMySQLtoJSON();
        await scraperFunctions.generateSQL();
        break;
      case '5':
        await scraperFunctions.generateJSON();
        break;
      case '6':
        console.log('Ação cancelada.');
        break;
      default:
        console.log('Ação desconhecida!');
    }
  }

  // Função principal que exibe o menu de opções para o usuário
  function main() {
    inquirer.default.prompt([
      {
        type: 'list',
        name: 'action',
        message: 'Escolha uma ação:',
        choices: [
          { name: '1) Padrão: Raspar e salvar no banco MySQL', value: '1' },
          { name: '2) Gerar arquivo SQL proveniente do banco MySQL', value: '2' },
          { name: '3) Gerar arquivo JSON a partir do banco MySQL', value: '3' },
          { name: '4) Gerar ambos os arquivos a partir do banco MySQL', value: '4' },
          { name: '5) Gerar arquivo JSON diretamente pela raspagem (sem banco de dados)', value: '5' },
          { name: '6) Cancelar', value: '6' },
        ],
      },
    ])
      .then(async (answers) => {
        await executeOption(answers.action);
      })
      .catch((error) => {
        console.error('Erro ao executar ação:', error);
      });
  }

  // Inicia o script
  main();
})();
