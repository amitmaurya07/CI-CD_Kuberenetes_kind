FROM node:18-alpine 

LABEL By=AmitMaurya   

WORKDIR /app

COPY package.* .

RUN npm install

COPY . .

CMD ["npm","start"]