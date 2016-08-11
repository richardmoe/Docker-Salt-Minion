#
# Salt Stack Salt Master Container
#

FROM ubuntu:16.04
MAINTAINER richard moe <me@richard.moe>

# Update System
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Dependencies

RUN apt-get install -y software-properties-common sudo salt-minion

# Volumes

VOLUME ['/etc/salt/minion.d', ]

# Add Run File

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Run Command

CMD "/usr/local/bin/run.sh"
