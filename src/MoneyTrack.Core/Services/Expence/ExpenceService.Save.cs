using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using MoneyTrack.Core.Helpers;
using MoneyTrack.Core.Mappers;
using MoneyTrack.Core.Models;
using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace MoneyTrack.Core.Services
{
    public partial class ExpenceService
    {
        public async Task<ServiceModelResult<SaveResponse>> SaveAsync(int id, ExpenceRequest model)
        {
            var result = new ServiceModelResult<SaveResponse>();
            result.Model = new SaveResponse() { TypeName = nameof(Domain.Models.Expence) };

            if (model == null)
                return BadRequest(result);

            var entities = await _context.Expence.Where(x => x.Id == id).ToListAsync();

            if (entities.Count > 1)
                return BadRequest(result);

            var entity = entities.SingleOrDefault();

            if (entity == null)
            {
                result.StatusCode = HttpStatusCode.Created;

                entity = model.ToEntity();

                _context.Expence.Add(entity);
            }
            else
            {
                entity = model.ToEntity(entity);

                _context.Expence.Update(entity);
            }

            try
            {
                await _context.SaveChangesAsync();

                result.Model.Id = entity.Id;
                result.Model.Saved = true;
            }
            catch (Exception ex)
            {
                var message = ExceptionHelper.GetaAllMessages(ex);

                _logger.LogError(ex, "Failed to create or update expence. Error was {@errorMessage}", id, message);

                if (result.StatusCode == HttpStatusCode.Created)
                    throw;
            }

            return result;
        }
    }
}
