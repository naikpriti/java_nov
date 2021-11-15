FROM tiangolo/uwsgi-nginx-flask:python3.6
RUN pip install redis
ADD /azure-vote /app
RUN  mkdir -p /home/LogFiles \
     && echo "root:Docker!" | chpasswd \
     && echo "cd /home" >> /etc/bash.bashrc \
     && apt update \
     && apt install -y --no-install-recommends openssh-server vim curl wget tcptraceroute

RUN  pip install redis

EXPOSE 2222 80
 
ADD     /azure-vote /app

ENV PORT 80
ENV PATH ${PATH}:/home/site/wwwroot
