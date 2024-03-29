FROM golang:1.4-cross

ENV GOPATH /go
ENV USER root

WORKDIR /go/src/github.com/SvenDowideit/markdownlint

RUN go get github.com/russross/blackfriday
run go get github.com/miekg/mmark

ADD . /go/src/github.com/SvenDowideit/markdownlint
RUN go get -d -v
RUN go build -o markdownlint main.go
RUN go test -v ./...

