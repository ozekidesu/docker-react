# 'as' is a way to 'tag' the phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# container path with production assets wil be /app/build

# run phase

FROM nginx

# copy contents of /app/build to nginx
COPY --from=builder /app/build /usr/share/nginx/html