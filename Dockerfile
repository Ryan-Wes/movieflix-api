# → É a versão do Node.js que vamos instalar dentro do nosso contêiner, para que consigamos instalar as dependências e executar os comandos;
FROM node:20 

# → É o diretório de trabalho do contêiner, o sistema operacional do contêiner é Linux, então os caminhos dentro do Linux são assim, eles começam com / diferente do Windows que é C:
WORKDIR /app

# → Copia o arquivo de dependências para dentro o contêiner e o . significa o diretório atual, pois o arquivo Dockerfile está no mesmo nível do package.json;
COPY package.json .

# → Instala as dependências necessárias para que o projeto possa funcionar com todas as bibliotecas que tem instaladas nele;
RUN npm install 

# → Copia todo o código para dentro do contêiner, o . serve para referenciar o diretório atual;
COPY . . 

# → Expõe a porta que a aplicação usa;
EXPOSE 3000 

# → É o comando para iniciar/rodar a nossa aplicação
CMD ["npm", "start"] 


# Comando para construir uma imagem: docker build -t <nome_da_imagem> .

# Explicação do comando docker build -t movieflix-api .:
# docker build: é o comando para construir a imagem Docker;
# -t movieflix-api: o -t é utilizado para dar um nome e uma versão (opcional) à imagem;
# . : o . significa o contexto de build, ou seja, é o diretório atual, com o . a gente faz menção ao diretório atual onde o Dockerfile está localizado, todos os arquivos que ele precisa buscar estão localizados nesse diretório.
# Comando para executar a imagem dentro de um contêiner: docker run -p 3000:3000 --name movieflix movieflix-api

# Explicação do comando docker run -p 3000:3000 --name movieflix movieflix-api:
# docker run: esse é o comando para criar e executar um contêiner à partir de uma imagem Docker;
# -p 3000:3000: serve para mapear a porta 3000 do contêiner para a porta 3000 do host;
# --name movieflix: atribui um nome ao contêiner;
# movieflix-api: é o nome da imagem que utilizamos para criar o contêiner;
# Comando para listar todas as imagens: docker images

# Comando para listar todos os contêineres ativos: docker ps

# Comando para listar todos os contêineres ativos e não ativos: docker ps -a