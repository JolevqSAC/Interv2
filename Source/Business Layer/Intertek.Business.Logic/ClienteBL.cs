
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
    using System.Transactions;

    public class ClienteBL:Singleton<ClienteBL>,IBaseLogic<Cliente>
    {
        private readonly IClienteRepository repository = new ClienteRepository();

        #region Miembros de IBaseLogic<Cliente>

        public IList<Cliente> GetAll()
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

        public IList<Cliente> GetAll(string sidx, string sord, int rows, int page, string where)
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

        public Cliente Single(int id)
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


        public Respuesta Guardar(Cliente item)
        {
            int id = 0;
            try
            {

               
                string mensaje = string.Empty;
                if (item.IDCliente == 0 )
                {
                    id = this.Add(item);
                    mensaje = (id == 0) ? "Ya existe Cliente con Nº  " + item.CLI_RUC : "Se Proceso con éxito";
                }
                else
                {
                    id = this.Update(item);
                    id = item.IDCliente;
                    mensaje = "Se Proceso con éxito";
                
                }

                return new Respuesta() { Extra = id.ToString(), Mensaje = mensaje };
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }
        public  int Add(Cliente entity)
        {
            try
            {
                int id;
                using (TransactionScope scope = new TransactionScope())
                {
                     id = repository.Add(entity);
                     if (id > 0)
                     {
                     
                     }
                   scope.Complete();
                }
              

                return id;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Update(Cliente entity)
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
