using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using MoneyTrack.Data.Context;
using MoneyTrack.Data.Initializer;
using System;

namespace MoneyTrack
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().EnsureDatabaseUpdated().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }

    internal static class ProgramExtensions
    {
        internal static IHost EnsureDatabaseUpdated(this IHost host)
        {
            using (var scope = host.Services.CreateScope())
            {
                var services = scope.ServiceProvider;
                try
                {
                    var appDataContext = services.GetRequiredService<AppDataContext>();

                    DatabaseInitializer.EnsureMoneyTrackAPISeed(appDataContext);
                }
                catch (Exception ex)
                {
                    Environment.Exit(-1);
                }
            }

            return host;
        }
    }
}
