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
        [HttpDelete("place/{id:int}")]
        [OpenApiTag("Expence")]
        [OpenApiOperation("Delete expence", "Delete expence")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<DeleteResponse>> DeletePlaceAsync(int id)
        {
            var serviceResult = await _expenceService.DeletePlaceAsync(id);

            return ModelOrError(serviceResult);
        }
    }
}
