using System;

namespace MoneyTrack.Core.Models
{
    public class OrderRequest
    {
        public int ExpencePlaceId { get; set; }
        public double Total { get; set; }
        public double? TotalDiscount { get; set; }
        public int UserId { get; set; }
        public DateTime PaymentDate { get; set; }
        public bool IsAutomatedPayment { get; set; }
        public byte[] ReceiptImage { get; set; } = null;
    }
}
