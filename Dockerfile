FROM node:10.16.0-jessie
COPY . /src
RUN cd /src && npm install
EXPOSE 80
CMD ["npm", "start"]
