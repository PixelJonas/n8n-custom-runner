FROM n8nio/runners:1.123.3

USER root

RUN cd /opt/runners/task-runner-javascript && pnpm add moment uuid
RUN cd /opt/runners/task-runner-python && uv pip install scikit-learn

USER runner