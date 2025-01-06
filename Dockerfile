# Use the official Golang image as the base image
FROM golang:1.22-alpine@sha256:58a82e883f0d11f52204d2baa58a62dc565c409105773526340f678c9dc2558f

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