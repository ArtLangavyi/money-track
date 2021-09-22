using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class ExpenceService
    {
        public async Task<ServiceModelResult<DeleteResponse>> DeletePlaceAsync(int id)
        {
            var result = new ServiceModelResult<DeleteResponse>();
            result.Model = new DeleteResponse() { TypeName = nameof(Domain.Models.ExpencePlace) };

            if (!(await PlaceCanBeDeleted(id)))
                return BadRequest(result);

            var entity = await _context.ExpencePlace.Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                try
                {
                    _context.ExpencePlace.Remove(entity);

                    await _context.SaveChangesAsync();

                    await dbContextTransaction.CommitAsync();

                    result.Model.Deleted = true;
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Failed to expence place {@id}. Error was {@errorMessage}", id, ex.Message);

                    await dbContextTransaction.RollbackAsync();
                }
            }

            return result;
        }

        private async Task<bool> PlaceCanBeDeleted(int id)
        {
            return !(await _context.Order.Include(e=>e.ExpencePlace).AnyAsync(e => e.ExpencePlace.Id == id));
        }
    }
}
