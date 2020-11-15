FROM ubuntu:20.04

RUN apt update && \
    apt install -y mosquitto openssl vim


# MQTT Broker config file
ADD conf/my_broker.conf /etc/mosquitto/conf.d/my_broker.conf

WORKDIR /etc/mosquitto

# helper scripts
ADD scripts/mq_entry.sh /usr/bin
ADD scripts/mq_bash.sh /usr/bin
RUN chmod 700 /usr/bin/mq_entry.sh
RUN chmod 700 /usr/bin/mq_bash.sh

ENTRYPOINT ["/usr/bin/mq_entry.sh"]