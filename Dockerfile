# 1-р шат: Build library
FROM node:18 AS build
WORKDIR /app
COPY . .

# OpenSSL compatibility
ENV NODE_OPTIONS=--openssl-legacy-provider

RUN yarn install
RUN yarn build

# 2-р шат: Nginx ашиглан `dist/`-ийг serve хийх
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
