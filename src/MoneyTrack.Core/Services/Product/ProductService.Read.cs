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
        public async Task<ServiceModelResult<ProductResponse>> ReadAsync(int id)
        {
            var result = new ServiceModelResult<ProductResponse>();

            var entity = await _context.Product.Where(x => x.Id == id).SingleOrDefaultAsync();
            
            if (entity == null)
                return NotFound(result);

            result.Model = entity.ToBaseModel();

            return result;
        }

        public async Task<ServiceModelResult<List<ProductResponse>>> GetListAsync()
        {
            var result = new ServiceModelResult<List<ProductResponse>>();

            var entities = await _context.Product.OrderBy(x => x.Name).ToListAsync();

            if (entities == null)
                return NotFound(result);

            result.Model = entities.Select(entity=>entity.ToBaseModel()).ToList();

            return result;
        }
    }
}
