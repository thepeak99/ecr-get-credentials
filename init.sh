#!/bin/sh

LINE=$(aws ecr get-login --no-include-email --region eu-central-1 | tr -d '\r')
USER=$(echo $LINE | cut -d " " -f 4)
PASSWORD=$(echo $LINE | cut -d " " -f 6)
HOST=$(echo $LINE | cut -d " " -f 7)
AUTH=$(echo $USER:$PASSWORD | base64 | tr -d '\n')

cat << EOF
{
    "auths" : { 
        "$HOST" : {
            "auth" : "$AUTH"
        }
    }
}
EOF
