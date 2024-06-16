# Use the official Debian image as the base image
FROM debian:bullseye-slim

# Install necessary packages for building the Go application
RUN apt-get update && apt-get install -y golang git

# Set up environment variables for the Go application
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV GO111MODULE=off

# Create and set the working directory within the container
RUN mkdir /app
WORKDIR /app

# Copy the Go application source code into the container
COPY . .

# Build the Go application
RUN go build -o main .

# Expose the application's port
EXPOSE 8080

# Start the Go application
CMD ["/app/main"]
