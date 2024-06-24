package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "Hello, wonderful world!")
    })

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
    fmt.Printf("Listening and serving HTTP on :%s\n", port)
    if err := http.ListenAndServe(":"+port, nil); err != nil {
        fmt.Printf("Failed to start server: %v\n", err)
    }
}
