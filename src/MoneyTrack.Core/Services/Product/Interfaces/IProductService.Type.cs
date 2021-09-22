using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial interface IProductService
    {
        Task<ServiceModelResult<List<ProductTypeResponse>>> ReadProductTypesAsync();
        Task<ServiceModelResult<ProductTypeResponse>> ReadProductTypeDetailsAsync(int id);
        Task<ServiceModelResult<SaveResponse>> SaveAsync(int id, ProductTypeRequest model);
        Task<ServiceModelResult<DeleteResponse>> DeleteProductTypeAsync(int id);
    }
}
