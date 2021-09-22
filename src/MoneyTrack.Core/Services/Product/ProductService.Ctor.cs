using Microsoft.Extensions.Logging;
using MoneyTrack.Data.Context;

namespace MoneyTrack.Core.Services
{
    public partial class ProductService : BaseService, IProductService
    {
        private readonly ILogger<ProductService> _logger;
        private readonly AppDataContext _context;
        public ProductService(AppDataContext context, ILogger<ProductService> logger)
        {
            _context = context;
            _logger = logger;
        }
    }
}
