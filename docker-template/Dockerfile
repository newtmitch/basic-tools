FROM node:0.12

ADD . /code
WORKDIR /code

RUN apt-get update && apt-get install -y curl git gcc make build-essential tmux vim rsync ruby-full
RUN gem install compass

RUN npm install
RUN npm install -g bower nodemon grunt-cli
RUN bower install --allow-root --config.interactive=false

CMD bash
