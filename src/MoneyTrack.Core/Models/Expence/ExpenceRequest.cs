
namespace MoneyTrack.Core.Models
{
    public class ExpenceRequest
    {
        public int ProductId { get; set; }

        public int OrderId { get; set; }

        public double Price { get; set; }

        public int Qantity { get; set; }

        public double Amount { get; set; }

        public double Discount { get; set; }
    }
}
