ARG VARIANT=11

FROM klein2ms/base-devcontainer:java-${VARIANT} AS base

# Build-time metadata as defined at https://github.com/opencontainers/image-spec/blob/master/annotations.md
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL \
    org.opencontainers.image.created=$BUILD_DATE \
    org.opencontainers.image.url="https://github.com/klein2ms/groovy-devcontainer" \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.revision=$VCS_REF \
    org.opencontainers.image.documentation="https://github.com/klein2ms/groovy-devcontainer" \
    org.opencontainers.image.source="https://github.com/klein2ms/groovy-devcontainer" \
    org.opencontainers.image.title="groovy-devcontainer" \
    org.opencontainers.image.description="A Groovy development container for Visual Studio Code"


ARG GROOVY_VERSION=3.0.6
ARG GRADLE_VERSION=6.7

# Install Groovy and Gradle
RUN su vscode -c "source /usr/local/sdkman/bin/sdkman-init.sh && sdk install groovy \"${GROOVY_VERSION}\"" \
    && su vscode -c "source /usr/local/sdkman/bin/sdkman-init.sh && sdk install gradle \"${GRADLE_VERSION}\""

FROM base AS devcontainer