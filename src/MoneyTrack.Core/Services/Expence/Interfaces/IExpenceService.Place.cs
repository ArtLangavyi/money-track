using MoneyTrack.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial interface IExpenceService
    {
        Task<ServiceModelResult<ExpencePlaceResponse>> ReadPlaceAsync(int id);
        Task<ServiceModelResult<List<ExpencePlaceResponse>>> GetPlaceListAsync();
        Task<ServiceModelResult<SaveResponse>> SavePlaceAsync(int id, ExpencePlaceRequest model);
        Task<ServiceModelResult<DeleteResponse>> DeletePlaceAsync(int id);
    }
}
