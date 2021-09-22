using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public interface IUserService
    {
        Task<ServiceModelResult<UserResponse>> ReadAsync(int id);
        Task<ServiceModelResult<List<UserResponse>>> GetListAsync();
        Task<ServiceModelResult<SaveResponse>> SaveAsync(int id, UserRequest model);
        Task<ServiceModelResult<DeleteResponse>> DeleteAsync(int id);
    }
}
