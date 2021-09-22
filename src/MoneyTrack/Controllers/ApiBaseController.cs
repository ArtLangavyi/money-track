using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Models;
using MoneyTrack.Models;
using System.Collections.Generic;
using System.Net;

namespace MoneyTrack.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class ApiBaseController : ControllerBase
    {
        protected readonly ILogger _logger;

        public ApiBaseController(ILogger logger)
        {
            _logger = logger;
        }

        protected ActionResult OkOrError(ServiceResult response)
        {
            if (response.IsError)
            {
                return Error(response.StatusCode, response.ErrorCode);
            }

            return Ok();
        }

        protected ActionResult<T> ModelOrError<T>(ServiceModelResult<T> response) where T : class, new()
        {
            if (response.IsError || response.Model == null)
            {
                return Error(response);
            }

            return StatusCode((int)response.StatusCode, response.Model);
        }

        protected ActionResult Error(HttpStatusCode statusCode, string errorCode)
        {
            _logger.LogError("Error response {@statusCode}: {@errorCode}", (int)statusCode, errorCode.ToString());

            var errorResponse = new ErrorResponse
            {
                PrimaryErrorCode = errorCode,
                Errors = new List<string> { errorCode }
            };

            return StatusCode((int)statusCode, errorResponse);
        }

        protected ActionResult Error(ServiceResult response)
        {
            return Error(response.StatusCode, response.ErrorCode);
        }

        protected ActionResult<T> Error<T>(ServiceResult response) where T : class, new()
        {
            return Error<T>(response.StatusCode, response.ErrorCode);
        }

        protected ActionResult<T> Error<T>(ServiceModelResult<T> response) where T : class, new()
        {
            return Error<T>(response.StatusCode, response.ErrorCode);
        }

        protected ActionResult<T> Error<T>(HttpStatusCode statusCode, string errorCode) where T : class, new()
        {
            _logger.LogError("Error response {@statusCode}: {@errorCode}", (int)statusCode, errorCode.ToString());

            var errorResponse = new ErrorResponse
            {
                PrimaryErrorCode = errorCode,
                Errors = new List<string> { errorCode }
            };

            return StatusCode((int)statusCode, errorResponse);
        }
    }
}
