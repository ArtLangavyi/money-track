using MoneyTrack.Domain.Abstractions;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MoneyTrack.Domain.Models
{
    public class Income : ITimeTracked
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public double Amount { get; set; }

        public User User { get; set; }

        [ForeignKey("User")]
        public int UserId { get; set; }

        [Required]
        public DateTime IncomeDate { get; set; }

        public IncomeType IncomeType { get; set; }

        [ForeignKey("IncomeType")]
        public int IncomeTypeId { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}
