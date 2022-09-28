# syntax=docker/dockerfile:1.4
FROM golang:1.17-alpine as builder

WORKDIR /work

COPY <<EOF go.mod
module hello
go 1.19
EOF

COPY <<EOF main.go
package main
import "fmt"
func main() {
    fmt.Println("Hello World!")
}
EOF
RUN go build -o hello .

FROM alpine:3.98

COPY --from=builder /work/hello /hello
CMD ["/hello"]

FROM alpine:3.97

COPY --from=builder /work/hello /hello
CMD ["/hello"]
