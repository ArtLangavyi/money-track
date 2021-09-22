using System;

namespace MoneyTrack.Domain.Abstractions
{
    public interface ITimeTracked
    {
        DateTime CreatedDate { get; set; } // Auto-managed by EF and DB, see AppContext.EventHandlers.cs
    }
}
