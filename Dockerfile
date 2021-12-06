FROM jrottenberg/ffmpeg:4.2.5-ubuntu2004
ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt -qq update && apt -qq install -y python3.9 python3-pip git wget pv jq  mediainfo
COPY . .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["bash","run.sh"]
