using Microsoft.EntityFrameworkCore;
using MoneyTrack.Core.Mappers;
using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class UserService
    {
        public async Task<ServiceModelResult<UserResponse>> ReadAsync(int id)
        {
            var result = new ServiceModelResult<UserResponse>();

            var entity = await _context.Users.Where(x => x.Id == id).SingleOrDefaultAsync();

            if (entity == null)
                return NotFound(result);

            result.Model = entity.ToBaseModel();

            return result;
        }

        public async Task<ServiceModelResult<List<UserResponse>>> GetListAsync()
        {
            var result = new ServiceModelResult<List<UserResponse>>();

            var entities = await _context.Users.OrderBy(x => x.FirstName).ToListAsync();

            if (entities == null)
                return NotFound(result);

            result.Model = entities.Select(entity => entity.ToBaseModel()).ToList();

            return result;
        }

    }
}
