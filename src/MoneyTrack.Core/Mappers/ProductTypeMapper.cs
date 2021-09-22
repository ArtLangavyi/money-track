using MoneyTrack.Core.Models;
using MoneyTrack.Domain.Models;

namespace MoneyTrack.Core.Mappers
{
    public static class ProductTypeMapper
    {
        public static ProductType ToEntity(this ProductTypeRequest model, ProductType? entity = null)
        {
            entity ??= new ProductType();

            if (model == null)
                return entity;

            entity.Name = model.Name;

            return entity;
        }

        public static ProductTypeResponse ToBaseModel(this ProductType model)
        {
            return new ProductTypeResponse()
            {
                Id = model.Id,
                Name = model.Name
            };
        }
        
    }
}
