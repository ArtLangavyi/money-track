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
        [HttpGet("{id:int}")]
        [OpenApiTag("Product")]
        [OpenApiOperation("Get product", "Get product details")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<ProductResponse>> GetAsync(int id)
        {
            var serviceResult = await _productService.ReadAsync(id);

            return ModelOrError(serviceResult);
        }

        [HttpGet("list")]
        [OpenApiTag("Product")]
        [OpenApiOperation("Get product list", "Get product list")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<ProductResponse>>> GetListAsync()
        {
            var serviceResult = await _productService.GetListAsync();

            return ModelOrError(serviceResult);
        }
    }
}
