# syntax=docker/dockerfile:1.4
FROM cgr.dev/chainguard/go as builder

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

FROM cgr.dev/chainguard/alpine-base

COPY --from=builder /work/hello /hello
CMD ["/hello"]
