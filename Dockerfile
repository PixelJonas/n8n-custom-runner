FROM n8nio/runners:2.1.4

USER root

# Install Python and required build tools
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    build-base \
    python3-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    portaudio-dev \
    musl-dev \
    g++ \
    pkgconfig
    

RUN cd /opt/runners/task-runner-javascript && pnpm add moment uuid axios cheerio node-fetch @qdrant/js-client-rest crypto
RUN cd /opt/runners/task-runner-python && uv pip install scikit-learn

USER runner
