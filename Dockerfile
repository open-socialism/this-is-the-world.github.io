FROM ruby:2.4.1

# ruby base doesn't specify locale
ENV LANG C.UTF-8

# can't pin the version of node js with the recommended debian install technique
# using this alternative for now - waiting on https://github.com/nodesource/distributions/issues/33
RUN FILE="nodejs_7.10.0-1nodesource1~jessie1_amd64.deb"; \
    wget "https://deb.nodesource.com/node_7.x/pool/main/n/nodejs/$FILE" -qO $FILE \
    && dpkg -i $FILE \
    && rm $FILE

RUN wget https://bootstrap.pypa.io/get-pip.py \
  && python get-pip.py

RUN pip install proselint==0.8.0
