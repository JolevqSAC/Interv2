using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
 public    class ProvinciaRepository :Repository,IProvinciaRepository
    {
     public IList<Provincia> GetAllProvincia(int IDDepartamento)
     {
         IList<Provincia> entidades = new List<Provincia>();
         var comando = BaseDatos.GetStoredProcCommand("getProvinciaByDepartamento");
         BaseDatos.AddInParameter(comando, "IDDepartamento", DbType.Int32, IDDepartamento);
         try
         {
             using (var lector = BaseDatos.ExecuteReader(comando))
             {
                 while (lector.Read())
                 {
                     var entidad = new Provincia();
                     entidad.IDProvincia = lector.IsDBNull(lector.GetOrdinal("IDProvincia")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDProvincia"));
                     entidad.PRO_Nombre = lector.IsDBNull(lector.GetOrdinal("PRO_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Nombre"));
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

        public IList<Business.Entity.Provincia> GetAll()
        {
            throw new NotImplementedException();
        }

        public IList<Business.Entity.Provincia> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Business.Entity.Provincia Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Business.Entity.Provincia entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Business.Entity.Provincia entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
