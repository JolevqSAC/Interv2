using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
  public   class DistritoRepository :Repository,IDistritoRepository
    {
      public IList<Distrito> GetAllDistrito(int IDProvincia)
      {
          IList<Distrito> entidades = new List<Distrito>();
          var comando = BaseDatos.GetStoredProcCommand("getDistritoByProvincia");
          BaseDatos.AddInParameter(comando, "IDProvincia", DbType.Int32, IDProvincia);
          try
          {
              using (var lector = BaseDatos.ExecuteReader(comando))
              {
                  while (lector.Read())
                  {
                      var entidad = new Distrito();
                      entidad.IDDistrito = lector.IsDBNull(lector.GetOrdinal("IDDistrito")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDDistrito"));
                      entidad.DIS_Nombre = lector.IsDBNull(lector.GetOrdinal("DIS_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("DIS_Nombre"));
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

        public IList<Business.Entity.Distrito> GetAll()
        {
            throw new NotImplementedException();
        }

        public IList<Business.Entity.Distrito> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Business.Entity.Distrito Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Business.Entity.Distrito entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Business.Entity.Distrito entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
