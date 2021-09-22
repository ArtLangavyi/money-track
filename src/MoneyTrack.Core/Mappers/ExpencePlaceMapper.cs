using MoneyTrack.Core.Models;
using MoneyTrack.Domain.Models;

namespace MoneyTrack.Core.Mappers
{
    public static class ExpencePlaceMapper
    {
        public static ExpencePlace ToEntity(this ExpencePlaceRequest model, ExpencePlace? entity = null)
        {
            entity ??= new ExpencePlace();

            if (model == null)
                return entity;

            entity.Name = model.Name;

            return entity;
        }

        public static ExpencePlaceResponse ToBaseModel(this ExpencePlace model)
        {
            return new ExpencePlaceResponse()
            {
                Id = model.Id,
                Name = model.Name
            };
        }
    }
}
