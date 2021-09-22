using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers.User
{
    public partial class UserController
    {
        [HttpGet("{id:int}")]
        [OpenApiTag("User")]
        [OpenApiOperation("Get user", "Get user details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<UserResponse>> GetAsync(int id)
        {
            var serviceResult = await _userService.ReadAsync(id);

            return ModelOrError(serviceResult);
        }

        [HttpGet("list")]
        [OpenApiTag("User")]
        [OpenApiOperation("Get user list", "Get user details list")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<UserResponse>>> GetListAsync()
        {
            var serviceResult = await _userService.GetListAsync();

            return ModelOrError(serviceResult);
        }
    }
}
