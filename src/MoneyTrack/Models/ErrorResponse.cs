using System.Collections.Generic;

namespace MoneyTrack.Models
{
    public class ErrorResponse
    {
        public ErrorResponse()
        {

        }

        public string PrimaryErrorCode { get; set; }
        public List<string> Errors { get; set; }
    }
}
