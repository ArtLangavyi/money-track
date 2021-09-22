using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Services;

namespace MoneyTrack.Controllers.User
{
    [ApiVersion("1")]
    public partial class UserController : ApiBaseController
    {
        private readonly ILogger<UserController> _logger;
        private readonly IUserService _userService;

        public UserController(IUserService userService, ILogger<UserController> logger) : base(logger)
        {
            _userService = userService;
            _logger = logger;
        }
    }
}
