using Microsoft.EntityFrameworkCore;
using MoneyTrack.Core.Mappers;
using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class OrderService
    {
        public async Task<ServiceModelResult<OrderResponse>> ReadAsync(int id)
        {
            var result = new ServiceModelResult<OrderResponse>();

            var entity = await _context.Order.Include(o => o.Expence).Include(o => o.ExpencePlace).Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            result.Model = entity.ToBaseModel();

            return result;
        }

        public async Task<ServiceModelResult<List<OrderResponse>>> GetListAsync()
        {
            var result = new ServiceModelResult<List<OrderResponse>>();

            var entities = await _context.Order
                                    .Include(o => o.ExpencePlace)
                                    .Include(o => o.Expence)
                                    .ThenInclude(e => e.Product)
                                    .OrderByDescending(x => x.PaymentDate).Take(10).ToListAsync();

            if (entities == null)
                return NotFound(result);

            result.Model = entities.Select(entity => entity.ToBaseModel()).ToList();

            return result;
        }

    }
}
