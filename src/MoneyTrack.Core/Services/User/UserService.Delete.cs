using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class UserService
    {
        public async Task<ServiceModelResult<DeleteResponse>> DeleteAsync(int id)
        {
            var result = new ServiceModelResult<DeleteResponse>();
            result.Model = new DeleteResponse() { TypeName = nameof(Domain.Models.User) };

            if (!(await CanBeDeleted(id)))
                return BadRequest(result);

            var entity = await _context.Users.Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                try
                {
                    _context.Users.Remove(entity);

                    await _context.SaveChangesAsync();

                    await dbContextTransaction.CommitAsync();

                    result.Model.Deleted = true;
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Failed to delete user {@id}. Error was {@errorMessage}", id, ex.Message);

                    await dbContextTransaction.RollbackAsync();
                }
            }

            return result;
        }

        private async Task<bool> CanBeDeleted(int id)
        {
            var result = await _context.Order.Include(o => o.User).AnyAsync(e => e.UserId == id);
            
            if (!result)
                result = await _context.Income.Include(o => o.User).AnyAsync(e => e.UserId == id);

            return !result;
        }
    }
}
