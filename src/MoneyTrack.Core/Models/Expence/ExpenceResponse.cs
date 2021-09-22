using System;

namespace MoneyTrack.Core.Models
{
    public class ExpenceResponse
    {
        public int Id { get; set; }
        public string ProductName { get; set; }
        public double Price { get; set; }
        public int Qantity { get; set; }
        public double Amount { get; set; }
        public double Discount { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
