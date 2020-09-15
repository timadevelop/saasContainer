FROM nginx

RUN mkdir -p /data/

RUN apt-get update
RUN apt-get install -y netcat

COPY config/ /etc/nginx/

COPY run.sh .
RUN chmod +x ./run.sh

CMD ./run.sh