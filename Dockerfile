FROM alpine:latest AS rats_builder
LABEL maintainer="emilio@ociotec.com"

RUN apk add --no-cache wget make gcc musl-dev

RUN wget http://downloads.sourceforge.net/project/expat/expat/2.0.1/expat-2.0.1.tar.gz && \
    tar -xvf expat-2.0.1.tar.gz && \
    cd expat-2.0.1 && \
    ./configure && \
    make && \
    make install

RUN wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rough-auditing-tool-for-security/rats-2.4.tgz && \
    tar -xzvf rats-2.4.tgz && \
    cd rats-2.4 && \
    ./configure && \
    make && \
    make install


FROM alpine:latest AS rats
LABEL maintainer="emilio@ociotec.com"

COPY --from=rats_builder /usr/local/ /usr/local/
