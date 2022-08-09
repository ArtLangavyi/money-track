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
        public async Task<ServiceModelResult<ExpencePlaceResponse>> ReadPlaceAsync(int id)
        {
            var result = new ServiceModelResult<ExpencePlaceResponse>();

            var entity = await _context.ExpencePlace.Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            result.Model = entity.ToBaseModel();

            return result;
        }

        public async Task<ServiceModelResult<List<ExpencePlaceResponse>>> GetPlaceListAsync()
        {
            var result = new ServiceModelResult<List<ExpencePlaceResponse>>();

            var entities = await _context.ExpencePlace.ToListAsync();

            if (entities == null)
                return NotFound(result);

            result.Model = entities.Select(entity => entity.ToBaseModel()).ToList();

            return result;
        }
    }
}
