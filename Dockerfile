# Build Phase --- Install dependencies and run the build process
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase  --- Copy files from the build phase
# For NGINX anything in /usr/share/nginx/html is going to be served automatically
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html