#
# Salt Stack Salt Master Container
#

FROM ubuntu:16.04
MAINTAINER richard moe <me@richard.moe>

# Update System


# Dependencies
RUN apt-get update
RUN apt-get -y install curl sudo
RUN curl https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold
RUN apt-get install -y software-properties-common sudo salt-minion

# Volumes

VOLUME ['/etc/salt/minion.d', ]

# Add Run File

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Run Command

CMD "/usr/local/bin/run.sh"
