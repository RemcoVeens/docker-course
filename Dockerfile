FROM debian:stable-slim

COPY docker /bin/goserver

ENV PORT=8991

CMD ["/bin/goserver"]
