# Não está sendo usado, pois o Puppeteer precisa de executar o Chrome no modo sandbox, o que não é possível no Docker

# Usar uma imagem oficial do Node.js como a imagem base
FROM node:20.7.0

# Instalar as dependências necessárias para o Puppeteer
RUN apt-get update && apt-get install -y \
  wget \
  gnupg \
  ca-certificates \
  procps \
  libnss3-dev \
  libxss1 \
  libasound2 \
  libatk1.0-0 \
  libc6 \
  libcairo2 \
  libcups2 \
  libdbus-1-3 \
  libexpat1 \
  libfontconfig1 \
  libgcc1 \
  libgconf-2-4 \
  libgdk-pixbuf2.0-0 \
  libglib2.0-0 \
  libgtk-3-0 \
  libnspr4 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libstdc++6 \
  libx11-6 \
  libx11-xcb1 \
  libxcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxext6 \
  libxfixes3 \
  libxi6 \
  libxrandr2 \
  libxrender1 \
  libxss1 \
  libxtst6 \
  lsb-release \
  xdg-utils

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