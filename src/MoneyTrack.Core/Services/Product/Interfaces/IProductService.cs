using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial interface IProductService
    {
        Task<ServiceModelResult<SaveResponse>> SaveAsync(int id, ProductRequest model);
        Task<ServiceModelResult<ProductResponse>> ReadAsync(int id);
        Task<ServiceModelResult<List<ProductResponse>>> GetListAsync();
        Task<ServiceModelResult<DeleteResponse>> DeleteAsync(int id);
    }
}
