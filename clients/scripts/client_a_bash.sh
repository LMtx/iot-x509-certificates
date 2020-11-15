#!/bin/bash

echo """
Hello inside the Client A container!

Let's start with generating the PK (Private Key) for this Client.

    openssl genrsa -out /client_a/certs/client_a.key 4096

Now we need to create the CSR (Certificate Sign Request) in order to obtain certificate for this Client from our CA:

    openssl req -new -out /client_a/csr/client_a.csr -key /client_a/certs/client_a.key -subj \"/CN=client_a\"

---

Let's switch to Client b for a sec.

---

CA signed our certificate, let's move it to proper directory:

    mv /client_a/csr/client_a.pem /client_a/certs/

Let's check the certificate exposed by MQTT Broker:

    openssl s_client -showcerts --key /client_a/certs/client_a.key --cert /client_a/certs/client_a.pem -CAfile /client_a/ca/ca.pem -tls1_3 -servername mq_broker -connect mq_broker:8883

Ok, now we are finally ready to subscribe to our MQTT Broker:

    mosquitto_sub -h mq_broker -p 8883 --key /client_a/certs/client_a.key --cert /client_a/certs/client_a.pem --cafile /client_a/ca/ca.pem -t test -d -v

"""

bash