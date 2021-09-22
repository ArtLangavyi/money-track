using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers
{
    public partial class ExpenceController
    {
        [HttpGet("{id:int}")]
        [OpenApiTag("Expence")]
        [OpenApiOperation("Get expence", "Get expence details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<ExpenceResponse>> GetAsync(int id)
        {
            var serviceResult = await _expenceService.ReadAsync(id);

            return ModelOrError(serviceResult);
        }

        [HttpGet("list/{orderId}")]
        [OpenApiTag("Expence")]
        [OpenApiOperation("Get expence list", "Get expence details list")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<ExpenceResponse>>> GetListAsync(int orderId)
        {
            var serviceResult = await _expenceService.GetListAsync(orderId);

            return ModelOrError(serviceResult);
        }
    }
}
