
using System.Linq;
using System.Text;

namespace Intertek.Business.Logic
{
    using System;
    using System.Collections.Generic;
    using DataAccess.Implementations;
    using DataAccess.Interfaces;
    using Entity;
    using Entity.Generics;

    public class ProductoBL : Singleton<ProductoBL>, IBaseLogic<Producto>
    {
        private readonly IProductoRepository repository = new ProductoRepository();

        #region Miembros de IBaseLogic<Producto>

        public IList<Producto> GetAll()
        {
            try
            {
                return repository.GetAll();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IList<Producto> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            try
            {
                return repository.GetAll(sidx, sord, rows, page, where);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Producto Single(int id)
        {
            try
            {
                return repository.Single(id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Count(string whereCondition = "")
        {
            try
            {
                return whereCondition == null ? repository.Count() : repository.Count(whereCondition);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Add(Producto entity)
        {
            try
            {
                return repository.Add(entity);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Update(Producto entity)
        {
            try
            {
                return repository.Update(entity);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Delete(int id)
        {
            try
            {
                return repository.Delete(id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion

    }
}
