using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using MoneyTrack.Core.Services;
using MoneyTrack.Data.Context;
using System.Collections.Generic;

namespace MoneyTrack
{
    public class Startup
    {
        const string ALLOW_DEVELOPMENT_CORS_ORIGINS_POLICY = "AllowDevelopmentSpecificOrigins";
        const string LOCAL_DEVELOPMENT_URL = "http://localhost:3000";
         
        public IConfiguration Configuration { get; }

        private readonly List<string> _nonLocalEnv = new List<string> { "Test", "Acc", "Prod", "Scrum" };
        private bool IsDevelopment() => !_nonLocalEnv.Contains(System.Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") ?? string.Empty);

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }


        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<AppDataContext>(o =>
            {
                if (IsDevelopment())
                    o.EnableSensitiveDataLogging(true);

                o.UseSqlServer(Configuration.GetValue<string>("ConnectionSettings:DefaultConnection"), b => b.MigrationsAssembly("MoneyTrack.Data"));
            });


            services.AddControllers();

            services.AddCors(options => {
                options.AddPolicy(name: ALLOW_DEVELOPMENT_CORS_ORIGINS_POLICY,
                    builder => {
                        builder.WithOrigins(LOCAL_DEVELOPMENT_URL)
                            .AllowAnyMethod()
                            .AllowAnyHeader()
                            .AllowCredentials();
                    });
            });


            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "MoneyTrack", Version = "v1" });
            });

            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IExpenceService, ExpenceService>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IOrderService, OrderService>(); 
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            UpdateDatabase(app);

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "MoneyTrack v1"));
            }

            app.UseRouting();

            app.UseAuthorization();

            if (env.IsDevelopment())
                app.UseCors(ALLOW_DEVELOPMENT_CORS_ORIGINS_POLICY);

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }

        private static void UpdateDatabase(IApplicationBuilder app)
        {
            using var serviceScope = app.ApplicationServices
                .GetRequiredService<IServiceScopeFactory>()
                .CreateScope();
            using var context = serviceScope.ServiceProvider.GetService<AppDataContext>();
            context.Database.Migrate();
        }
    }
}
