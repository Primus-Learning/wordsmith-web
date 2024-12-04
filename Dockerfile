FROM golang:alpine as builder

WORKDIR /usr/local/app
ARG TARGETARCH
 # Adjust path based on your Go project structure
COPY dispatcher.go .

RUN go build dispatcher.go 

FROM alpine:latest
WORKDIR /usr/local/app
COPY --from=builder /usr/local/app/dispatcher ./
COPY static ./static/ 

# Optional: Listening port
EXPOSE 80