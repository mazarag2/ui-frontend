#BUILD PHASE
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY package*.json ./
RUN npm run build

# RUN PHASE
FROM nginx
EXPOSE 3000
COPY --from=0 /app/build /usr/share/nginx/html
