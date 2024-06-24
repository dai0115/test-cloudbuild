# Use the official Golang image as a build stage
FROM golang:1.21 as build

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod ./
RUN go mod tidy

# Copy the source code
COPY . .

# Build the application
RUN go build -o main .

# Use a minimal image for the final stage
FROM golang:1.21

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled binary from the build stage
COPY --from=build /app/main .

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
CMD ["./main"]
