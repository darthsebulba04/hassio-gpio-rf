ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY data/run.sh /

RUN chmod a+x /run.sh

# Install requirements for add-on
RUN apk add --no-cache py3-pip python3 python3-dev gcc musl-dev
RUN pip3 install wheel rpi-rf 

# So let's set it to our add-on persistent data directory.

CMD [ "/run.sh" ]
