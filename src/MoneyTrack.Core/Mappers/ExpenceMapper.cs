using MoneyTrack.Core.Models;
using MoneyTrack.Domain.Models;

namespace MoneyTrack.Core.Mappers
{
    public static class ExpenceMapper
    {
        public static Expence ToEntity(this ExpenceRequest model, Expence? entity = null)
        {
            entity ??= new Expence();

            if (model == null)
                return entity;

            entity.ProductId = model.ProductId;
            entity.OrderId = model.OrderId;
            entity.Price = model.Price;
            entity.Qantity = model.Qantity;
            entity.Amount = model.Amount;
            entity.Discount = model.Discount;

            return entity;
        }

        public static ExpenceResponse ToBaseModel(this Expence model)
        {
            return new ExpenceResponse()
            {
                Id = model.Id,
                ProductName = model.Product.Name,
                Amount = model.Amount,
                CreatedDate = model.CreatedDate,
                Discount = model.Discount,
                Price = model.Price,
                Qantity = model.Qantity,
            };
        }
    }
}
