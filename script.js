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
      case 'Padrão: Raspar e salvar no banco MySQL':
        await scraperFunctions.scrapeAndSave();
        break;
      case 'Gerar arquivo SQL proveniente do banco MySQL':
        await scraperFunctions.generateSQL();
        break;
      case 'Gerar arquivo JSON a partir do banco MySQL':
        await scraperFunctions.exportMySQLtoJSON();
        break;
      case 'Gerar ambos os arquivos a partir do banco MySQL':
        await scraperFunctions.exportMySQLtoJSON();
        await scraperFunctions.generateSQL();
        break;
      case 'Gerar arquivo JSON diretamente pela raspagem (sem banco de dados)':
        await scraperFunctions.generateJSON();
        break;
      case 'Cancelar':
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
          'Padrão: Raspar e salvar no banco MySQL',
          'Gerar arquivo SQL proveniente do banco MySQL',
          'Gerar arquivo JSON a partir do banco MySQL',
          'Gerar ambos os arquivos a partir do banco MySQL',
          'Gerar arquivo JSON diretamente pela raspagem (sem banco de dados)',
          'Cancelar',
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
