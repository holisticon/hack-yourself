FROM toolisticon/kalilinux

ENV DEBIAN_FRONTEND noninteractive

ENV PATH "$PATH:/usr/local/scripts"

ADD ./init.sh /init.sh
ADD scripts /usr/local/scripts
# Install metasploit, pip and fierce
RUN apt-get -y update ; apt-get -y --force-yes install ruby metasploit-framework

CMD /init.sh
