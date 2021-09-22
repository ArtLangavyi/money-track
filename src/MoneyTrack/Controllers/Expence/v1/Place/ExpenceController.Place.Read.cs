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
        [HttpGet("place/{id:int}")]
        [OpenApiTag("Expence")]
        [OpenApiOperation("Get expence place", "Get expence place details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<ExpencePlaceResponse>> GetPlaceAsync(int id)
        {
            var serviceResult = await _expenceService.ReadPlaceAsync(id);

            return ModelOrError(serviceResult);
        }

        [HttpGet("place/list")]
        [OpenApiTag("Expence")]
        [OpenApiOperation("Get expence place list", "Get expence place details list")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<ExpencePlaceResponse>>> GetPlaceListAsync()
        {
            var serviceResult = await _expenceService.GetPlaceListAsync();

            return ModelOrError(serviceResult);
        }
    }
}
