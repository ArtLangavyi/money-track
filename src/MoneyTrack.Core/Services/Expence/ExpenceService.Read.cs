using Microsoft.EntityFrameworkCore;
using MoneyTrack.Core.Mappers;
using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class ExpenceService
    {
        public async Task<ServiceModelResult<ExpenceResponse>> ReadAsync(int id)
        {
            var result = new ServiceModelResult<ExpenceResponse>();

            var entity = await _context.Expence.Include(e => e.Product).Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            result.Model = entity.ToBaseModel();

            return result;
        }

        public async Task<ServiceModelResult<List<ExpenceResponse>>> GetListAsync(int orderId)
        {
            var result = new ServiceModelResult<List<ExpenceResponse>>();

            var entities = await _context.Expence
                .Include(e => e.Product)
                .Include(e => e.Order)
                .Where(e => e.OrderId == orderId).ToListAsync();

            if (entities == null)
                return NotFound(result);

            result.Model = entities.Select(entity => entity.ToBaseModel()).ToList();

            return result;
        }
    }
}
