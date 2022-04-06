FROM alpine
ENTRYPOINT  while true; do echo "Hello practicaldevopsguy!" ; $(echo hostname) ; $(echo date); sleep 60; done
