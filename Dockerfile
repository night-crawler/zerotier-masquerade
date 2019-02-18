FROM zerotier/zerotier-containerized

RUN apk update \
 && apk upgrade \
 && apk add iptables

ADD ./main.sh /main.sh
ADD ./masquerade.sh /masquerade.sh
