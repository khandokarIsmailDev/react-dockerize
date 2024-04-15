# multi stage korle alada alada name dite hobe

FROM node:21-alpine as builder

WORKDIR /home/project

COPY package*.json .

RUN yarn

COPY . .

RUN yarn global add vite && vite build

# stage 2
# now we need nginx for web server 

FROM nginx:1.25 as Final

# aita nginx er defalut file location. ai folder e amader sob file folder rakte hobe, tai aitakei WORKDIR e banaya fellam
WORKDIR /usr/share/nginx/html/

# /home/project/dist/ aita amader build file er index.html and css 
COPY --from=builder /home/project/dist ./
