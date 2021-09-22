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
        [HttpDelete("{id:int}")]
        [OpenApiTag("User")]
        [OpenApiOperation("Delete user", "Delete user details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<DeleteResponse>> DeleteAsync(int id)
        {
            var serviceResult = await _userService.DeleteAsync(id);

            return ModelOrError(serviceResult);
        }
    }
}
