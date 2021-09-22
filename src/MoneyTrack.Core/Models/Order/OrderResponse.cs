using System;
using System.Collections.Generic;

namespace MoneyTrack.Core.Models
{
    public class OrderResponse
    {
        public int Id { get; set; }
        public ExpencePlaceResponse ExpencePlace { get; set; }
        public double Total { get; set; }
        public double? TotalDiscount { get; set; }
        public UserResponse User { get; set; }
        public DateTime PaymentDate { get; set; }
        public bool IsAutomatedPayment { get; set; }
        public byte[] ReceiptImage { get; set; }
        public DateTime CreatedDate { get; set; }
        public IList<ExpenceResponse> Expence { get; set; }
    }
}
