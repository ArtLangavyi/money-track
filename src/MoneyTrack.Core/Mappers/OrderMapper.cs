using MoneyTrack.Core.Models;
using MoneyTrack.Domain.Models;
using System.Linq;

namespace MoneyTrack.Core.Mappers
{
    public static class OrderMapper
    {
        public static Order ToEntity(this OrderRequest model, Order? entity = null)
        {
            entity ??= new Order();

            if (model == null)
                return entity;

            entity.UserId = model.UserId;
            entity.ExpencePlaceId = model.ExpencePlaceId;
            entity.Total = model.Total;
            entity.TotalDiscount = model.TotalDiscount;
            entity.PaymentDate = model.PaymentDate;
            entity.IsAutomatedPayment = model.IsAutomatedPayment;
            entity.ReceiptImage = model.ReceiptImage;

            return entity;
        }

        public static OrderResponse ToBaseModel(this Order model)
        {
            return new OrderResponse()
            {
                Id = model.Id,
                CreatedDate = model.CreatedDate,
                Expence = model.Expence?.Select(e => e.ToBaseModel()).ToList(),
                ExpencePlace = model.ExpencePlace?.ToBaseModel(),
                IsAutomatedPayment = model.IsAutomatedPayment,
                PaymentDate = model.PaymentDate,
                ReceiptImage = model.ReceiptImage,
                Total = model.Total,
                TotalDiscount = model.TotalDiscount,
                User = model.User?.ToBaseModel()
            };
        }

    }
}
