using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using NSwag.Annotations;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Controllers
{
    public partial class ProductController
    {
        [HttpGet("type/{id:int}")]
        [OpenApiTag("Product type")]
        [OpenApiOperation("Get product type", "Get product type details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<ProductTypeResponse>> GetProductTypeAsync(int id)
        {
            var serviceResult = await _productService.ReadProductTypeDetailsAsync(id);

            return ModelOrError(serviceResult);
        }

        [HttpGet("type/list")]
        [OpenApiTag("Product type")]
        [OpenApiOperation("Get product type list", "Get product type list details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<ProductTypeResponse>>> GetProductTypeListAsync()
        {
            var serviceResult = await _productService.ReadProductTypesAsync();

            return ModelOrError(serviceResult);
        }
    }
}
