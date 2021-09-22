using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using MoneyTrack.Domain.Models;

namespace MoneyTrack.Data.Context
{
    public partial class AppDataContext : DbContext
    {
        public virtual DbSet<Expence> Expence { get; set; }
        public virtual DbSet<ExpencePlace> ExpencePlace { get; set; }
        public virtual DbSet<Income> Income { get; set; }
        public virtual DbSet<IncomeType> IncomeType { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductType> ProductType { get; set; }
        public virtual DbSet<User> Users { get; set; }

        public AppDataContext()
        {
            AttachEventHandlers();
        }

        public AppDataContext(DbContextOptions<AppDataContext> options) : base(options)
        {
            AttachEventHandlers();
        }

        partial void OnEntityTrackedPartial(object sender, EntityTrackedEventArgs e);
    }
}
