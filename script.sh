#!/bin/bash
# Script que verifica o status do serviço httpd e salva o resultado em um arquivo no diretório /mnt/nfs/dheymisonnunes

DATA=$(date +%d/%m/%Y)
HORA=$(date +%H:%M:%S)
SERVICO="httpd"
STATUS=$(systemctl is-active $SERVICO)

if [ $STATUS == "active" ]; then
    MENSAGEM="O $SERVICO está ONLINE"
    echo "$DATA $HORA - $SERVICO - active - $MENSAGEM" >> /mnt/nfs/dheymisonnunes/online.txt
else
    MENSAGEM="O $SERVICO está offline"
    echo "$DATA $HORA - $SERVICO - inactive - $MENSAGEM" >> /mnt/nfs/dheymisonnunes/offline.txt
fi
