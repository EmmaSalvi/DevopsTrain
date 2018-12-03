package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"wsf/devopstrain/handler"
)

func main() {

	// connection := os.Getenv("DATABASE_URL")

	fmt.Println(os.Getenv("DATABASE_URL"))

	port := os.Getenv("PORT") //OS
	// variable port configurée par et pour Heroku
	if port == "" {
		port = "8080"
	}

	myHandler := handler.NewHandler()

	server := &http.Server{
		Addr:    ":" + port,
		Handler: myHandler,
		// ReadTimeout:  10 * time.Second,
		// WriteTimeout: 10 * time.Second,
	}

	fmt.Println("Ici le log")
	fmt.Println("Server is running at", port)

	log.Fatal(server.ListenAndServe())
}
