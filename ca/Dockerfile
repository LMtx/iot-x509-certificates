FROM ubuntu:20.04

RUN apt update && \
    apt install -y openssl

# prepare folders for certificates
RUN mkdir -p /root/ca/secret
RUN mkdir -p /root/ca/certificate

# AUTOMATED STEPS - TO BE COMMENTED OUT 
# generate the private key for CA
# RUN openssl genrsa -out /root/ca/secret/ca.key 4096

# create the self-signed certificate for the CA
# RUN openssl req -new -x509 -days 360 -key /root/ca/secret/ca.key -out /root/ca/certificate/ca.pem -subj "/CN=my_private_ca"

WORKDIR /root/ca

# helper scripts
ADD scripts/ca_entry.sh /usr/bin
ADD scripts/ca_bash.sh /usr/bin
RUN chmod 700 /usr/bin/ca_entry.sh
RUN chmod 700 /usr/bin/ca_bash.sh

CMD ["/usr/bin/ca_entry.sh"]