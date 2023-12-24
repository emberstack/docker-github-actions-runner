FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt update -y && apt upgrade -y

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
		zip \
		unzip \
&& rm -rf /var/lib/apt/lists/*


# RUN apt install -y --no-install-recommends \
#     curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip


WORKDIR /actions-runner

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]