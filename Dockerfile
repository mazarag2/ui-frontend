#BUILD PHASE
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE
FROM nginx
EXPOSE 8080
COPY --from=0 /app/build /usr/share/nginx/html
