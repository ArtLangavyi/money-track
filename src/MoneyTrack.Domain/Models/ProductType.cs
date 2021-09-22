using System.ComponentModel.DataAnnotations;

namespace MoneyTrack.Domain.Models
{
    public class ProductType
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
