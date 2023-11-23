# Usar uma imagem oficial do Node.js como a imagem base
FROM node:16.14-alpine

# Definir o diretório de trabalho no container
WORKDIR /app

# Copiar o package.json e o package-lock.json (se disponível)
COPY package* ./

# Instalar as dependências do projeto
RUN npm install

# Copiar os arquivos do projeto para o container
COPY . .

# Expõe a porta que a aplicação vai rodar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]