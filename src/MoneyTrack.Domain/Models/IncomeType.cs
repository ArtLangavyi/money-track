using System.ComponentModel.DataAnnotations;

namespace MoneyTrack.Domain.Models
{
    public class IncomeType
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
