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
        [HttpPost("{id:int}")]
        [OpenApiTag("Order")]
        [OpenApiOperation("Save order", "Create new order or update existing")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<SaveResponse>> SaveAsync(int id, [FromBody] OrderRequest request)
        {
            var serviceResult = await _orderService.SaveAsync(id, request);

            return ModelOrError(serviceResult);
        }
    }
}
