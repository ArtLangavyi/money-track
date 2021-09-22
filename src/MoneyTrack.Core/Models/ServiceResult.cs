using System.Net;

namespace MoneyTrack.Core.Models
{
#nullable enable
    public interface IServiceResult
    {
        HttpStatusCode StatusCode { get; set; }
        string ErrorCode { get; set; }
        bool IsError { get; }
    }

    public class ServiceResult : IServiceResult
    {
        public HttpStatusCode StatusCode { get; set; } = HttpStatusCode.OK;

        public string ErrorCode { get; set; } = "Undefined";

        public virtual bool IsError => (int)StatusCode >= 400 || ErrorCode != "Undefined";
    }

    public class ServiceModelResult<T> : ServiceResult where T : class, new()
    {
        public T? Model { get; set; }

        public override bool IsError => Model == null || base.IsError;
    }

    public class ServiceEntityResult<T> : ServiceResult where T : class, new()
    {
        public T? Entity { get; set; }

        public override bool IsError => Entity == null || base.IsError;
    }

    public class ServiceValueResult<T> : ServiceResult where T : struct
    {
        public T Model { get; set; }

        public override bool IsError => base.IsError;
    }

    public class ServiceTrueResult : ServiceValueResult<bool>
    {
        public override bool IsError => base.IsError || Model != true;
    }

    public static class ServiceResultHelper
    {
        public static T CopyInto<T>(this IServiceResult source, T destination) where T : IServiceResult
        {
            if (source != null && destination != null)
            {
                destination.ErrorCode = source.ErrorCode;
                destination.StatusCode = source.StatusCode;
            }
            return destination;
        }

        public static T CopyFrom<T>(this T destination, IServiceResult source) where T : IServiceResult
        {
            if (source != null && destination != null)
            {
                destination.ErrorCode = source.ErrorCode;
                destination.StatusCode = source.StatusCode;
            }
            return destination;
        }

        public static T Set<T>(this T destination, HttpStatusCode statusCode) where T : IServiceResult
        {
            if (destination != null)
            {
                destination.StatusCode = statusCode;
            }
            return destination;
        }
        public static T Set<T>(this T destination, string errorCode) where T : IServiceResult
        {
            if (destination != null)
            {
                destination.ErrorCode = errorCode;
            }
            return destination;
        }
    }
}
