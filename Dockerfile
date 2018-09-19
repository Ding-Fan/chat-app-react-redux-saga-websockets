FROM nginx:latest

RUN apt-get update

RUN apt-get install -y git

RUN curl -sL https://deb.nodesource.com/setup_8.x | -E bash - && apt-get install -y nodejs

RUN node -v

RUN npm install -g yarn

RUN git clone https://github.com/Ding-Fan/chat-app-react-redux-saga-websockets.git

RUN cd chat-app-react-redux-saga-websockets

RUN yarn && yarn build

RUN cp dist /etc/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
