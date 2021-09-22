using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial interface IExpenceService
    {
        Task<ServiceModelResult<ExpenceResponse>> ReadAsync(int id);
        Task<ServiceModelResult<List<ExpenceResponse>>> GetListAsync(int orderId);
        Task<ServiceModelResult<SaveResponse>> SaveAsync(int id, ExpenceRequest model);
        Task<ServiceModelResult<DeleteResponse>> DeleteAsync(int id);
    }
}
