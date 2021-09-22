using MoneyTrack.Core.Models;
using System.Net;

namespace MoneyTrack.Core.Services
{
    public class BaseService
    {
        protected ServiceModelResult<T> BadRequest<T>(ServiceModelResult<T> result) where T : class, new()
        {
            result ??= new ServiceModelResult<T>();

            result.ErrorCode = "BadRequest";
            result.StatusCode = HttpStatusCode.BadRequest;

            return result;
        }

        protected ServiceModelResult<T> NotFound<T>(ServiceModelResult<T> result) where T : class, new()
        {
            result ??= new ServiceModelResult<T>();

            result.ErrorCode = "NotFound";
            result.StatusCode = HttpStatusCode.NotFound;

            return result;
        }

        protected ServiceResult NotFound(ServiceResult result)
        {
            result ??= new ServiceResult();

            result.ErrorCode = "NotFound";
            result.StatusCode = HttpStatusCode.NotFound;

            return result;
        }
    }
}
