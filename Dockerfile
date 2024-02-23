FROM alpine:latest

RUN apk add --no-cache vlc
RUN adduser -D vlc
USER vlc
WORKDIR /home/vlc

CMD cvlc http://${ip}:4747/video --sout "#transcode{vcodec=h264,acodec=mpga,ab=128,channels=2,samplerate=44100}:standard{access=file,mux=mp4,dst=output.mp4}"