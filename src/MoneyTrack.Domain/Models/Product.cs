using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MoneyTrack.Domain.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        public ProductType ProductType { get; set; }

        [ForeignKey("ProductType")]
        public int ProductTypeId { get; set; }
    }
}
