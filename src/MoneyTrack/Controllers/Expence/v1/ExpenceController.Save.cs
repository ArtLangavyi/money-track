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
        [HttpPost("{id:int}")]
        [OpenApiTag("Expence")]
        [OpenApiOperation("Save expence", "Save expence details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<SaveResponse>> SaveAsync(int id, [FromBody] ExpenceRequest request)
        {
            var serviceResult = await _expenceService.SaveAsync(id, request);

            return ModelOrError(serviceResult);
        }
    }
}
