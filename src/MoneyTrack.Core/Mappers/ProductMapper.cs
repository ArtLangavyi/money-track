using MoneyTrack.Core.Models;
using MoneyTrack.Domain.Models;

namespace MoneyTrack.Core.Mappers
{
    public static class UserMapper
    {
        public static User ToEntity(this UserRequest model, User? entity = null)
        {
            entity ??= new User();

            if (model == null)
                return entity;

            entity.Id = model.Id;
            entity.FirstName = model.FirstName;
            entity.MiddleName = model.MiddleName;
            entity.LastName = model.LastName;

            return entity;
        }

        public static UserResponse ToBaseModel(this User model)
        {
            return new UserResponse()
            {
                Id = model.Id,
                FirstName = model.FirstName,
                MiddleName = model.MiddleName,
                LastName = model.LastName
            };
        }
        
    }
}
