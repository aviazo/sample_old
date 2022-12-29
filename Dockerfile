FROM node
WORKDIR /src/app


COPY sample-app/ .
RUN npm install
EXPOSE 3000

CMD ["node","index.js"]
