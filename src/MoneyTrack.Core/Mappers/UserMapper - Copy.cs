using MoneyTrack.Core.Models;
using MoneyTrack.Domain.Models;

namespace MoneyTrack.Core.Mappers
{
    public static class ProductMapper
    {
        public static Product ToEntity(this ProductRequest model, Product? entity = null)
        {
            entity ??= new Product();

            if (model == null)
                return entity;

            entity.Name = model.Name;
            entity.ProductTypeId = model.ProductTypeId;

            return entity;
        }

        public static ProductResponse ToBaseModel(this Product model)
        {
            return new ProductResponse()
            {
                Id = model.Id,
                Name = model.Name,
                ProductTypeId = model.ProductTypeId
            };
        }

    }
}
