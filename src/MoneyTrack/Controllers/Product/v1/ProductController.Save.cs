using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers
{
    public partial class ProductController
    {
        [HttpPost("{id:int}")]
        [OpenApiTag("Product")]
        [OpenApiOperation("Save product", "Create new product or update existing")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<SaveResponse>> SaveAsync(int id, [FromBody] ProductRequest request)
        {
            var serviceResult = await _productService.SaveAsync(id, request);

            return ModelOrError(serviceResult);
        }
    }
}
