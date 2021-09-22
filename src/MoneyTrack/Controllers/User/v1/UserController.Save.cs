using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers.User
{
    public partial class UserController
    {
        [HttpPost("{id:int}")]
        [OpenApiTag("User")]
        [OpenApiOperation("Save user", "Create new user or update existing")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<SaveResponse>> SaveAsync(int id, [FromBody] UserRequest request)
        {
            var serviceResult = await _userService.SaveAsync(id, request);

            return ModelOrError(serviceResult);
        }
    }
}
