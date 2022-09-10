FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /app
EXPOSE 80
EXPOSE 2022

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
RUN mkdir -p /opt/net5_startup
RUN chmod -R 777 /opt/net5_startup

WORKDIR /src
COPY ["MoneyTrack/MoneyTrack.csproj", "MoneyTrack/"]

RUN dotnet restore "MoneyTrack/MoneyTrack.csproj"
COPY . .
WORKDIR "/src/MoneyTrack"
RUN dotnet build "MoneyTrack.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MoneyTrack.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MoneyTrack.dll"]