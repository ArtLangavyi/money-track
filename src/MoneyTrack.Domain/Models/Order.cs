using MoneyTrack.Domain.Abstractions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MoneyTrack.Domain.Models
{
    public class Order : ITimeTracked
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public ExpencePlace ExpencePlace { get; set; }

        [ForeignKey("ExpencePlace")]
        public int ExpencePlaceId { get; set; }

        [Required]
        public double Total { get; set; }

        public double? TotalDiscount { get; set; }

        public User User { get; set; }

        [ForeignKey("User")]
        public int UserId { get; set; }

        [Required]
        public DateTime PaymentDate { get; set; }

        [Required]
        public bool IsAutomatedPayment { get; set; }

        public byte[] ReceiptImage { get; set; }

        public DateTime CreatedDate { get; set; }

        public ICollection<Expence> Expence { get; set; }
    }
}
