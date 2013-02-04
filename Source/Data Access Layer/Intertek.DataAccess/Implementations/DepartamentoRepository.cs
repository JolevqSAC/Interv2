using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
    public class DepartamentoRepository : Repository, IDepartamentoRepository
    {


        public IList<Departamento> GetAllDepartamento(int IDPais)
        {
            IList<Departamento> entidades = new List<Departamento>();
            var comando = BaseDatos.GetStoredProcCommand("getDepartamentoByPais");
            BaseDatos.AddInParameter(comando, "IDPais", DbType.Int32, IDPais);
            try
            {
                using (var lector = BaseDatos.ExecuteReader(comando))
                {
                    while (lector.Read())
                    {
                        var entidad = new Departamento();
                        entidad.IDDepartamento = lector.IsDBNull(lector.GetOrdinal("IDDepartamento")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDDepartamento"));
                        entidad.DEP_Nombre = lector.IsDBNull(lector.GetOrdinal("DEP_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("DEP_Nombre"));
                        entidades.Add(entidad);
                    }
                    lector.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Business.Entity.Departamento> GetAll()
        {
            throw new NotImplementedException();
        }

        public IList<Business.Entity.Departamento> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Business.Entity.Departamento Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Business.Entity.Departamento entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Business.Entity.Departamento entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
