# Define variables
IMAGE_NAME := go-app
CONTAINER_NAME := go-app-container
DOCKERFILE_PATH := ./Dockerfile
PORT := 1234

# Default target
all: test build

# Run Go tests before building
test:
	@echo "Running Go tests..."
	go test ./... -v

# Build the Docker image
build: test
	@echo "Building Docker image: $(IMAGE_NAME)"
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE_PATH) .

# Run the Docker container
run:
	@echo "Running Docker container: $(CONTAINER_NAME)"
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):$(PORT) $(IMAGE_NAME)
