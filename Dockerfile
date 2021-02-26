FROM golang:1.13-alpine as build
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn,direct
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -o bookinfo

###
FROM scratch as final
COPY --from=build /app/bookinfo .
CMD ["/bookinfo"]