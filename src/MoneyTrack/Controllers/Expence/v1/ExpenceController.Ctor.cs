using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Services;

namespace MoneyTrack.Controllers
{
    [ApiVersion("1")]
    public partial class ExpenceController : ApiBaseController
    {
        private readonly ILogger<ExpenceController> _logger;
        private readonly IExpenceService _expenceService;

        public ExpenceController(IExpenceService expenceService, ILogger<ExpenceController> logger) : base(logger)
        {
            _expenceService = expenceService;
            _logger = logger;
        }
    }
}
