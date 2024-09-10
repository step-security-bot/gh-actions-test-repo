# Use the official Golang image as the base image
FROM golang:1.22-alpine@sha256:48eab5e3505d8c8b42a06fe5f1cf4c346c167cc6a89e772f31cb9e5c301dcf60

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the workspace
COPY go.mod go.sum ./

# Download all Go modules
RUN go mod download

# Copy the rest of the project files to the workspace
COPY . .

# Build the Go app
RUN go build -o main .

# Command to run the executable
CMD ["/app/main"]