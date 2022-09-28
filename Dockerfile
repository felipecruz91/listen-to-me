# syntax=docker/dockerfile:1.4
FROM 

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

FROM alpine:3.14

COPY --from=build /work/hello /hello
CMD ["/hello"]
