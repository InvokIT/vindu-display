FROM node:8 as build
WORKDIR /project

COPY package.json package-lock.json ./
RUN npm install

COPY ./public ./public
COPY ./src ./src

RUN npm run build

FROM nginx:stable
WORKDIR /usr/share/nginx/html
COPY --from=build /project/ ./
