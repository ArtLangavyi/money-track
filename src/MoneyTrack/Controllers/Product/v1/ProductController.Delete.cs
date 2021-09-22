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
        [HttpDelete("{id:int}")]
        [OpenApiTag("Product")]
        [OpenApiOperation("Delete product", "Delete product details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<DeleteResponse>> DeleteAsync(int id)
        {
            var serviceResult = await _productService.DeleteAsync(id);

            return ModelOrError(serviceResult);
        }
    }
}
