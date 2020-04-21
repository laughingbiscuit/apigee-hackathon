FROM alpine:3.11

RUN apk add nodejs npm
ADD test /home
WORKDIR home
RUN npm i

CMD npm test
