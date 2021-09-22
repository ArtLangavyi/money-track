#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0-buster-slim AS base
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /app
EXPOSE 2020

FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS build
WORKDIR /src
COPY ["MoneyTrack/MoneyTrack.csproj", "MoneyTrack/"]
COPY ["MoneyTrack.Domain/MoneyTrack.Domain.csproj", "MoneyTrack.Domain/"]
COPY ["MoneyTrack.Core/MoneyTrack.Core.csproj", "MoneyTrack.Core/"]
COPY ["MoneyTrack.Data/MoneyTrack.Data.csproj", "MoneyTrack.Data/"]
RUN dotnet restore "MoneyTrack/MoneyTrack.csproj" -s https://api.nuget.org/v3/index.json
COPY . .
WORKDIR "/src/MoneyTrack"
RUN dotnet build "MoneyTrack.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MoneyTrack.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MoneyTrack.dll"]