using System.ComponentModel.DataAnnotations;

namespace MoneyTrack.Domain.Models
{
    public class ExpencePlace
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
