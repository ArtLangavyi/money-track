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
        [HttpDelete("type/{id:int}")]
        [OpenApiTag("Product type")]
        [OpenApiOperation("Delete product type", "Delete product type details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<DeleteResponse>> DeleteProductTypeAsync(int id)
        {
            var serviceResult = await _productService.DeleteProductTypeAsync(id);

            return ModelOrError(serviceResult);
        }
    }
}
