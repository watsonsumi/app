FROM public.ecr.aws/lts/ubuntu:latest

# Actualizar los paquetes existentes en la imagen
RUN apt-get update && apt-get upgrade -y

# Instalar Node.js y npm
RUN apt-get install -y nodejs npm

WORKDIR /ecs-app

COPY package*.json ./
COPY controller controller
COPY server.js server.js

RUN npm install
# RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
# USER node
EXPOSE 80

ENTRYPOINT ["npm", "start"]
