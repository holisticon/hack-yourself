FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
ADD ./init.sh /init.sh
# Install metasploit, pip and fierce
RUN apt-get -y update ; apt-get -y --force-yes install ruby metasploit-framework kali-linux-full

# Attach this container to stdin when running, like this:
# docker run -t -i linux/kali/metasploit
CMD /init.sh
