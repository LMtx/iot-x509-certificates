#!/bin/bash

echo """
Hello inside the mq_broker container!

This is going to be our MQTT Broker.

Let's start with generating the PK (Private Key) for this MQTT Broker.

    openssl genrsa -out /etc/mosquitto/certs/mq_broker.key 4096

Now we need to create the CSR (Certificate Sign Request) in order to obtain certificate for this MQTT Broker from our CA:

    openssl req -new -out /var/csr/mq_broker.csr -key /etc/mosquitto/certs/mq_broker.key -subj \"/CN=mq_broker\"

---

Let's switch to CA and sign certificate for out broker.

----

We should get our certificate in /var/csr/ :

    ls /var/csr/

Let's check this certificate and move it to the proper folder:

    openssl x509 -in /var/csr/mq_broker.pem -text

    mv /var/csr/mq_broker.pem /etc/mosquitto/certs/

---

Let's switch to setup of Clients A and B.

---

CA certificate was already attached using docker volumes.
In order to verify this certificate execute:

    openssl x509 -in /etc/mosquitto/ca_certificates/ca.pem -text


Let's check the MQTT Broker configuration:

    cat /etc/mosquitto/conf.d/my_broker.conf

Finally we can start our Broker:

    mosquitto -v -c /etc/mosquitto/conf.d/my_broker.conf
    
---

Let's switch to the Client A.

"""

bash