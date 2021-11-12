FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN curl -sLk https://github.com/github/codeql-action/releases/download/codeql-bundle-20211025/codeql-bundle-linux64.tar.gz -o /tmp/codeql-bundle-linux64.tar.gz && \
    mkdir -p /codeql && \
    mkdir -p /codeqlanalysis && \
    tar -xvzf /tmp/codeql-bundle-linux64.tar.gz -C /codeql && \
    rm -f /tmp/codeql-bundle-linux64.tar.gz

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /project
COPY . .

RUN /codeql/codeql/codeql database init /codeqlanalysis/db --db-cluster --source-root=. --begin-tracing --language=csharp && \
    source /codeqlanalysis/db/temp/tracingEnvironment/start-tracing.sh && \
    dotnet build codeql-dotnet6/codeql-dotnet6.csproj && \
    /codeql/codeql/codeql database finalize /codeqlanalysis/db --db-cluster
