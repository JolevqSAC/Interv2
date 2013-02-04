using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using System.Data;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class PaisRepository : Repository, IPaisRepository
    {
       public List<Pais> GetAllPais()
       {
           List<Pais> entidades = new List<Pais>();
           var comando = BaseDatos.GetStoredProcCommand("SelectAllPais");     
           try
           {
               using (var lector = BaseDatos.ExecuteReader(comando))
               {
                   while (lector.Read())
                   {
                       var entidad = new Pais();
                       entidad.IDPais = lector.IsDBNull(lector.GetOrdinal("IDPais")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDPais"));
                       entidad.PAI_Nombre = lector.IsDBNull(lector.GetOrdinal("PAI_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("PAI_Nombre"));                    
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


  

     

   

       public IList<Pais> GetAll()
       {
           throw new NotImplementedException();
       }

       public IList<Pais> GetAll(string sidx, string sord, int rows, int page, string where)
       {
           throw new NotImplementedException();
       }

       public Pais Single(int id)
       {
           throw new NotImplementedException();
       }

       public int Count(string where = "")
       {
           throw new NotImplementedException();
       }

       public int Add(Pais entity)
       {
           throw new NotImplementedException();
       }

       public int Update(Pais entity)
       {
           throw new NotImplementedException();
       }

       public int Delete(int id)
       {
           throw new NotImplementedException();
       }
    }
}
