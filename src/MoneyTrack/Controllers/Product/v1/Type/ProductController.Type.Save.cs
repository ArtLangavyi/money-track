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
        [HttpPost("type/{id:int}")]
        [OpenApiTag("Product type")]
        [OpenApiOperation("Save product type", "Create new product type or update existing")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<SaveResponse>> SaveProductTypeAsync(int id, [FromBody] ProductTypeRequest request)
        {
            var serviceResult = await _productService.SaveAsync(id, request);

            return ModelOrError(serviceResult);
        }
    }
}
