FROM nginx:latest

RUN sudo apt-get update

RUN sudo apt-get install -y git

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && sudo apt-get install -y nodejs

RUN sudo node -v

RUN sudo npm install -g yarn

RUN sudo git clone https://github.com/Ding-Fan/chat-app-react-redux-saga-websockets.git

RUN sudo cd chat-app-react-redux-saga-websockets

RUN sudo yarn && yarn build

RUN sudo cp dist /etc/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
