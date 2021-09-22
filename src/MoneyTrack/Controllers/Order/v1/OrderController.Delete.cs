using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers
{
    public partial class OrderController
    {
        [HttpDelete("{id:int}")]
        [OpenApiTag("Order")]
        [OpenApiOperation("Delete user", "Delete order details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<DeleteResponse>> DeleteAsync(int id)
        {
            var serviceResult = await _orderService.DeleteAsync(id);

            return ModelOrError(serviceResult);
        }
    }
}
