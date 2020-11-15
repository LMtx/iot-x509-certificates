#!/bin/bash

echo """
Hello inside the Client B container!

Following steps are the same as for Client A so I automated them for you :)

Let's check the status for Client B:

    find

---

Let's switch to CA in order to create certificates.

---

CA signed our certificate, let's move it to proper directory:

    mv /client_b/csr/client_b.pem /client_b/certs/

Let's push our first message to the MQTT Broker:

    mosquitto_pub -h mq_broker -p 8883 --key /client_b/certs/client_b.key --cert /client_b/certs/client_b.pem --cafile /client_b/ca/ca.pem -t test -m hello -d

As a final step let's check what would happen if we try to connect to our MQTT Broker using self-signed certificate not the one signed by our CA.

Let's create a certificate that is signed by Client (not CA): 

    openssl req -new -x509 -days 360 -key certs/client_b.key -out certs/client_b_2.pem -subj \"/CN=client_b\"

And try to connect to our Broker:

    mosquitto_pub -h mq_broker -p 8883 --key /client_b/certs/client_b.key --cert /client_b/certs/client_b_2.pem --cafile /client_b/ca/ca.pem -t test -m hello -d

"""

bash