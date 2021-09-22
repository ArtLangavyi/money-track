using MoneyTrack.Domain.Abstractions;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MoneyTrack.Domain.Models
{
    public class Expence : ITimeTracked
    {
        [Key]
        public int Id { get; set; }

        public Product Product { get; set; }

        [ForeignKey("Product")]
        public int ProductId { get; set; }

        public Order Order { get; set; }

        [ForeignKey("Order")]
        public int OrderId { get; set; }

        [Required]
        public double Price { get; set; }
        
        [Required]
        public int Qantity { get; set; }

        [Required]
        public double Amount { get; set; }

        [Required]
        public double Discount { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}
