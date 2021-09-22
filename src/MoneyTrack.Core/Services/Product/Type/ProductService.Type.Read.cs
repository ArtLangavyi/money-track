using Microsoft.EntityFrameworkCore;
using MoneyTrack.Core.Mappers;
using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class ProductService
    {
        public async Task<ServiceModelResult<ProductTypeResponse>> ReadProductTypeDetailsAsync(int id)
        {
            var result = new ServiceModelResult<ProductTypeResponse>();

            var entity = await _context.ProductType.Where(x => x.Id == id).SingleOrDefaultAsync();
            
            if (entity == null)
                return NotFound(result);

            result.Model = entity.ToBaseModel();

            return result;
        }

        public async Task<ServiceModelResult<List<ProductTypeResponse>>> ReadProductTypesAsync()
        {
            var result = new ServiceModelResult<List<ProductTypeResponse>>();

            var entities = await _context.ProductType.OrderBy(pt=>pt.Name).ToListAsync();

            if (entities == null)
                return NotFound(result);

            result.Model = entities.Select(entity=> entity.ToBaseModel()).ToList();

            return result;
        }
    }
}
