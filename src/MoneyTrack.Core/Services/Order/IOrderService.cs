using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public interface IOrderService
    {
        Task<ServiceModelResult<OrderResponse>> ReadAsync(int id);
        Task<ServiceModelResult<List<OrderResponse>>> GetListAsync();
        Task<ServiceModelResult<SaveResponse>> SaveAsync(int id, OrderRequest model);
        Task<ServiceModelResult<DeleteResponse>> DeleteAsync(int id);
    }
}
