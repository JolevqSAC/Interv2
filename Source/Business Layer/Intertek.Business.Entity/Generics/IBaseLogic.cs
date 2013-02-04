using System.Collections.Generic;

namespace Intertek.Business.Entity.Generics
{
    public interface IBaseLogic<TEntity> where TEntity : class
    {
        IList<TEntity> GetAll();

        IList<TEntity> GetAll(string sidx, string sord, int rows, int page, string @where);

        TEntity Single(int id);

        int Count(string @where = "");

        int Add(TEntity entity);

        int Update(TEntity entity);

        int Delete(int id);
    }
}