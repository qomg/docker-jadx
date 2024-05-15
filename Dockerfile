FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y --no-install-recommends openjdk-11-jdk

ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
ENV PATH="$JAVA_HOME/bin:$PATH"

# RUN git config --global http.version HTTP/1.1
RUN curl -Lo jadx.zip "https://github.com/skylot/jadx/releases/latest/download/jadx-1.5.0.zip"
RUN unzip jadx.zip -d /usr/local/
ENV PATH=$PATH:/usr/local/jadx/bin
RUN jadx --version
RUN rm -rf jadx.zip

# COPY codex.apk .
# RUN jadx codex.apk

ENTRYPOINT ["tail", "-f", "/dev/null"]
