# CodeQL with dotnet 6

## dotnet 3.1 project succeeds

```shell
git clone --single-branch --branch 3.1 https://github.com/qljcherry/codeql-dotnet6 .
docker build -f codeql-dotnet3.dockerfile .
```

## dotnet 6.0 project fails

```shell
git clone --single-branch --branch 6.0 https://github.com/qljcherry/codeql-dotnet6 .
docker build -f codeql-dotnet6.dockerfile .
```
