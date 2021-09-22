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
        public async Task<ServiceModelResult<DeleteResponse>> DeleteProductTypeAsync(int id)
        {
            var result = new ServiceModelResult<DeleteResponse>();
            result.Model = new DeleteResponse() { TypeName = nameof(Domain.Models.ProductType) };
            
            if(!(await ProdcytTypeCanBeDeleted(id)))
                return BadRequest(result);

            var entity = await _context.ProductType.Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                try
                {
                    _context.ProductType.Remove(entity);

                    await _context.SaveChangesAsync();

                    await dbContextTransaction.CommitAsync();

                    result.Model.Deleted = true;
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Failed to product type {@id}. Error was {@errorMessage}", id, ex.Message);

                    await dbContextTransaction.RollbackAsync();
                }
            }

            return result;
        }

        private async Task<bool> ProdcytTypeCanBeDeleted(int id)
        {
            return !(await _context.Expence.Include(p => p.Product).AnyAsync(p => p.Product.ProductTypeId == id));
        }
    }
}
