using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Services;

namespace MoneyTrack.Controllers
{
    [ApiVersion("1")]
    public partial class OrderController : ApiBaseController
    {
        private readonly ILogger<OrderController> _logger;
        private readonly IOrderService _orderService;

        public OrderController(IOrderService orderService, ILogger<OrderController> logger) : base(logger)
        {
            _orderService = orderService;
            _logger = logger;
        }
    }
}
