# Use a specific version of golang:alpine for reproducible builds and multiarch builds
FROM --platform=$BUILDPLATFORM golang:alpine3.19 AS builder

# Install git, which is required for fetching Go dependencies.
# Combine update and add into one RUN statement to reduce layers.
# Use --no-cache to avoid caching the index in the container.
RUN apk update && apk add --no-cache git

# Set the working directory inside the container.
WORKDIR /build

# Copy only the files needed for go mod to download dependencies.
# This optimizes caching for layer with go.mod and go.sum.
COPY go.mod .
COPY go.sum .

# Download dependencies before copying the entire source code.
# This allows Docker to cache the downloaded dependencies as a layer.
RUN go mod download

# Copy the rest of the source code.
COPY . .

# Accept version as a build argument, defaulting to "0.0.0".
ARG version="0.0.0"

# Set the target OS and architecture for cross-compilation.
# These arguments will be passed by the docker buildx command.
ARG TARGETOS
ARG TARGETARCH

# Build the Go app as a static binary.
# Output the binary to a known location for easier retrieval in later stages.
# Use CGO_ENABLED=0 for a fully static binary that doesn't depend on C libraries.
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags "-X main.Version=$version" -o /build/yj .

# Use scratch (an empty image) for the smallest possible image size.
FROM scratch

# Copy the binary from the builder stage to the final image.
COPY --from=builder /build/yj /bin/yj

# Set the binary as the entrypoint of the container.
ENTRYPOINT ["/bin/yj"]
