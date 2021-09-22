using Microsoft.Extensions.Logging;
using MoneyTrack.Data.Context;

namespace MoneyTrack.Core.Services
{
    public partial class ExpenceService : BaseService, IExpenceService
    {
        private readonly ILogger<ExpenceService> _logger;
        private readonly AppDataContext _context;
        public ExpenceService(AppDataContext context, ILogger<ExpenceService> logger)
        {
            _context = context;
            _logger = logger;
        }
    }
}
