using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity.Generics;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;
using Intertek.DataAccess.Implementations;

namespace Intertek.Business.Logic
{
    public class ContactoClienteBL : Singleton<ContactoClienteBL>, IBaseLogic<ContactoCliente>
    {
        private readonly IContactoClienteRepository repository = new ContactoClienteRepository();

        public IList<ContactoCliente> GetAll()
        {
            throw new NotImplementedException();
        }

        public IList<ContactoCliente> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public ContactoCliente Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(ContactoCliente entity)
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

        public int Update(ContactoCliente entity)
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
            throw new NotImplementedException();
        }

        public List<ContactoCliente> Search(int idCiente)
        {

         return new ContactoClienteRepository().Search(idCiente);


        }


        public Respuesta Guardar(ContactoCliente item)
        {
            int id = 0;
            try
            {


                string mensaje = string.Empty;
                if (item.IDContactoCliente == 0)
                {
                    id = this.Add(item);
                   // mensaje = (id == 0) ? "Ya existe Cliente con Nº  " + item.COC_Nombres : "Se Proceso con éxito";
                    mensaje = "Se Proceso con éxito";
                }
                else
                {
                    id = this.Update(item);
                    id = item.IDContactoCliente;
                    mensaje = "Se Proceso con éxito";

                }

                return new Respuesta() { Extra = id.ToString(), Mensaje = mensaje };
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }
    }
}
