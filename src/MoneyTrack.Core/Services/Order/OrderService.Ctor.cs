using Microsoft.Extensions.Logging;
using MoneyTrack.Data.Context;

namespace MoneyTrack.Core.Services
{
    public partial class OrderService : BaseService, IOrderService
    {
        private readonly ILogger<OrderService> _logger;
        private readonly AppDataContext _context;
        public OrderService(AppDataContext context, ILogger<OrderService> logger)
        {
            _context = context;
            _logger = logger;
        }
    }
}
