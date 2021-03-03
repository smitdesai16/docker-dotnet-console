FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

WORKDIR /App

COPY . .

RUN dotnet publish -c Release




FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /App

COPY --from=build-env /App/bin/Release/netcoreapp5.0/publish .

# COPY --from=build-env . .

ENTRYPOINT ["dotnet", "docker-dotnet-console.dll"]