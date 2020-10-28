FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
    git \
    cmake
RUN git clone https://github.com/open-source-parsers/jsoncpp.git
RUN apt-get update && apt-get install -y \
    pkg-config

ENV export CXX=/usr/local/bin/g++

RUN cd jsoncpp && git checkout 1.9.4 && \
    mkdir build && cd build && \
    cmake .. && make -j 12 && make install && \
    cd ../.. && rm -rf jsoncpp