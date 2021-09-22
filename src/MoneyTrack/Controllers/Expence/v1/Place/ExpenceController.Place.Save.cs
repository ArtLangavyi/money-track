using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers
{
    public partial class ExpenceController
    {
        [HttpPost("place/{id:int}")]
        [OpenApiTag("Expence")]
        [OpenApiOperation("Save expence place", "Save expence place details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<SaveResponse>> SavePlaceAsync(int id, [FromBody] ExpencePlaceRequest request)
        {
            var serviceResult = await _expenceService.SavePlaceAsync(id, request);

            return ModelOrError(serviceResult);
        }
    }
}
