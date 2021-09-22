using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Services;

namespace MoneyTrack.Controllers
{
    [ApiVersion("1")]
    public partial class ProductController : ApiBaseController
    {
        private readonly ILogger<ProductController> _logger;
        private readonly IProductService _productService;

        public ProductController(IProductService productService, ILogger<ProductController> logger) : base(logger)
        {
            _productService = productService;
            _logger = logger;
        }
    }
}
