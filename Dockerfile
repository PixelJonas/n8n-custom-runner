FROM n8nio/runners:2.1.4

USER root

# Install Python and required build tools
RUN wget https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic//v2.12.14/x86_64/apk.static

RUN ./apk.static add --no-cache \
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
