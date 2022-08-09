using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class ProductService
    {
        public async Task<ServiceModelResult<DeleteResponse>> DeleteAsync(int id)
        {
            var result = new ServiceModelResult<DeleteResponse>();
            result.Model = new DeleteResponse() { TypeName = nameof(Domain.Models.Product) };

            if (!(await CanBeDeleted(id)))
                return BadRequest(result);

            var entity = await _context.Product.Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                try
                {
                    _context.Product.Remove(entity);

                    await _context.SaveChangesAsync();

                    await dbContextTransaction.CommitAsync();

                    result.Model.Deleted = true;
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Failed to product {@id}. Error was {@errorMessage}", id, ex.Message);

                    await dbContextTransaction.RollbackAsync();
                }
            }

            return result;
        }

        private async Task<bool> CanBeDeleted(int id)
        {
            return !(await _context.Expence.AnyAsync(e => e.ProductId == id));
        }
    }
}
