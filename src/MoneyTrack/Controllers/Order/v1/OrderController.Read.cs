using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers
{
    public partial class OrderController
    {
        [HttpGet("{id:int}")]
        [OpenApiTag("Order")]
        [OpenApiOperation("Get order", "Get order details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<OrderResponse>> GetAsync(int id)
        {
            var serviceResult = await _orderService.ReadAsync(id);

            return ModelOrError(serviceResult);
        }

        [HttpGet("list")]
        [OpenApiTag("Order")]
        [OpenApiOperation("Get order list", "Get order details list")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<OrderResponse>>> GetListAsync()
        {
            var serviceResult = await _orderService.GetListAsync();

            return ModelOrError(serviceResult);
        }
    }
}
