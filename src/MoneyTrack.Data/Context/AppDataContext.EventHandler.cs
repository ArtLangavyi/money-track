using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using MoneyTrack.Domain.Abstractions;
using System;

namespace MoneyTrack.Data.Context
{
    public partial class AppDataContext
    {
        protected void AttachEventHandlers()
        {
            ChangeTracker.Tracked -= OnEntityTrackedPartial;
            ChangeTracker.Tracked += OnEntityTrackedPartial;
        }

        partial void OnEntityTrackedPartial(object sender, EntityTrackedEventArgs e)
        {
            if (e.FromQuery)
                return;

            // Automatically set CreatedDate for CREATED entities 
            if (e.Entry.State == EntityState.Added && e.Entry.Entity is ITimeTracked entity)
                entity.CreatedDate = DateTime.Now;
        }
    }
}
