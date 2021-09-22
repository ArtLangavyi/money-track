using Microsoft.EntityFrameworkCore;
using MoneyTrack.Data.Context;

namespace MoneyTrack.Data.Initializer
{
    public class DatabaseInitializer
    {
        public static void EnsureMoneyTrackAPISeed(AppDataContext context)
        {
            context.Database.Migrate();
        }
    }
}
