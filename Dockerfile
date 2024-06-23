FROM node:20.14-alpine

WORKDIR /app

COPY ./package*.json .

RUN npm install

COPY . .

CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0" ]

EXPOSE 8080

FROM caddy:2.6.2-alpine

COPY ./Caddyfile /etc/caddy/Caddyfile

EXPOSE 3000

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]