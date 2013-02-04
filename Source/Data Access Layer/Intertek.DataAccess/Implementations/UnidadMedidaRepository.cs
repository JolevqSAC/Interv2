using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using System.Data;
using Intertek.Business.Entity;

namespace Intertek.DataAccess.Implementations
{
 public    class UnidadMedidaRepository  : Repository ,IUnidadMedidaRepository
 {
     #region Metodos Publicos
     public int Add(UnidadMedida unidad)
     {
         var comando = BaseDatos.GetStoredProcCommand("InsertUnidadMedida");
         BaseDatos.AddOutParameter(comando, "IDUnidadMedida", DbType.Int32, 10);
         BaseDatos.AddInParameter(comando, "UNM_Codigo", DbType.String, unidad.UNM_Codigo);
         BaseDatos.AddInParameter(comando, "UNM_Nombre", DbType.String, unidad.UNM_Nombre);
         BaseDatos.AddInParameter(comando, "UNM_NombreCorto", DbType.String, unidad.UNM_NombreCorto);
         BaseDatos.AddInParameter(comando, "UNM_Estado", DbType.String, unidad.Estado);
         BaseDatos.AddInParameter(comando, "UNM_UsuarioCreaccion", DbType.String, unidad.UsuarioCreacion);
         BaseDatos.AddInParameter(comando, "UNM_UsuarioModificacion", DbType.String, unidad.UsuarioModificacion);
       
         var resultado = BaseDatos.ExecuteNonQuery(comando);
         if (resultado == 0) throw new Exception("Error al Agregar Unidad Medida.");

         var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDUnidadMedida"); ;
         comando.Dispose();
         return valorDevuelto;
     }

     public int Delete(int id)
     {
         var comando = BaseDatos.GetStoredProcCommand("DeleteUnidadMedida");
         BaseDatos.AddInParameter(comando, "IDUnidadMedida", DbType.Int32, id);

         var resultado = BaseDatos.ExecuteNonQuery(comando);
         if (resultado == 0) throw new Exception("Error al Eliminar Unidad Medida.");
         comando.Dispose();
         return 1;
     }
     public int Update(UnidadMedida unidad)
     {
         var comando = BaseDatos.GetStoredProcCommand("UpdateUnidadMedida");
         BaseDatos.AddInParameter(comando, "IDUnidadMedida", DbType.Int32, unidad.IDUnidadMedida);
         BaseDatos.AddInParameter(comando, "UNM_Codigo", DbType.String, unidad.UNM_Codigo);
         BaseDatos.AddInParameter(comando, "UNM_Nombre", DbType.String, unidad.UNM_Nombre);
         BaseDatos.AddInParameter(comando, "UNM_NombreCorto", DbType.String, unidad.UNM_NombreCorto);
         BaseDatos.AddInParameter(comando, "UNM_Estado", DbType.String, unidad.Estado);
       //  BaseDatos.AddInParameter(comando, "UNM_UsuarioCreacion", DbType.String, unidad.UsuarioCreacion);
       //  BaseDatos.AddInParameter(comando, "UNM_FechaHoraCreacion", DbType.String, unidad.FechaHoraCreacion);
         BaseDatos.AddInParameter(comando, "UNM_UsuarioModificacion", DbType.String, unidad.UsuarioModificacion);
       //  BaseDatos.AddInParameter(comando, "UNM_FechaHoraModificacion", DbType.String, unidad.FechaHoraModificacion);
         var resultado = BaseDatos.ExecuteNonQuery(comando);
         if (resultado == 0) throw new Exception("Error al Modificar Unidad Medida.");
         comando.Dispose();
         return resultado;
     }

     public UnidadMedida Single(int id)
     {
         var unidad = default(UnidadMedida);
         var comando = BaseDatos.GetStoredProcCommand("SelectUnidadMedida");
         BaseDatos.AddInParameter(comando, "IDUnidadMedida", DbType.Int32, id);
        using (var lector = BaseDatos.ExecuteReader(comando))
         {
            while (lector.Read())
             {
                 unidad = new UnidadMedida
                 {
                     IDUnidadMedida = lector.IsDBNull(lector.GetOrdinal("IDUnidadMedida")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDUnidadMedida")),
                     UNM_Codigo = lector.IsDBNull(lector.GetOrdinal("UNM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Codigo")),
                     UNM_Nombre = lector.IsDBNull(lector.GetOrdinal("UNM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Nombre")),
                     UNM_NombreCorto = lector.IsDBNull(lector.GetOrdinal("UNM_NombreCorto")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_NombreCorto")),
                     Estado = lector.IsDBNull(lector.GetOrdinal("UNM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Estado")),
                     UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioCreacion")),
                     FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraCreacion")),
                     UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioModificacion")),
                     FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraModificacion"))
                 };
             }
         }
         comando.Dispose();
         return unidad;
     }

     public IList<UnidadMedida> GetAll(string sidx, string sord, int rows, int page, string @where)
     {
         IList<UnidadMedida> entidades = new List<UnidadMedida>();

         var comando = BaseDatos.GetStoredProcCommand("SelectPaginationUnidadMedida");
         BaseDatos.AddInParameter(comando, "@SortColumn", DbType.String, sidx);
         BaseDatos.AddInParameter(comando, "@SortOrder", DbType.String, sord);
         BaseDatos.AddInParameter(comando, "@PageSize", DbType.Int32, rows);
         BaseDatos.AddInParameter(comando, "@CurrentPage", DbType.Int32, page);
         BaseDatos.AddInParameter(comando, "@Where", DbType.String, where);

         try
         {
             using (var lector = BaseDatos.ExecuteReader(comando))
             {
                 while (lector.Read())
                 {
                     var entidad = new UnidadMedida();
                     entidad.IDUnidadMedida = lector.IsDBNull(lector.GetOrdinal("IDUnidadMedida")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDUnidadMedida"));
                     entidad.UNM_Codigo = lector.IsDBNull(lector.GetOrdinal("UNM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Codigo"));
                     entidad.UNM_Nombre = lector.IsDBNull(lector.GetOrdinal("UNM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Nombre"));
                     entidad.UNM_NombreCorto = lector.IsDBNull(lector.GetOrdinal("UNM_NombreCorto")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_NombreCorto"));
                     entidad.Estado = lector.IsDBNull(lector.GetOrdinal("UNM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Estado"));
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

     public int Count(string @where = "")
     {
         int cantidad = 0;
         var comando = BaseDatos.GetStoredProcCommand("CountUnidadMedida");

         try
         {
             BaseDatos.AddInParameter(comando, "@Where", DbType.String, @where);

             using (var dr = BaseDatos.ExecuteReader(comando))
             {
                 if (dr.Read())
                 {
                     cantidad = dr.IsDBNull(dr.GetOrdinal("Cantidad")) ? 0 : dr.GetInt32(dr.GetOrdinal("Cantidad"));
                 }
             }
         }
         catch (Exception ex)
         {
             throw new Exception(ex.Message);
         }

         comando.Dispose();
         return cantidad;
     }

     public IList<UnidadMedida> GetAll()
     {
         var entidades = new List<UnidadMedida>();
         var comando = BaseDatos.GetStoredProcCommand("SelectAllUnidadMedida");

         using (var lector = BaseDatos.ExecuteReader(comando))
         {
             while (lector.Read())
             {
                 entidades.Add(new UnidadMedida
                 {
                     IDUnidadMedida = lector.IsDBNull(lector.GetOrdinal("IDUnidadMedida")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDUnidadMedida")),
                     UNM_Codigo = lector.IsDBNull(lector.GetOrdinal("UNM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Codigo")),
                     UNM_Nombre = lector.IsDBNull(lector.GetOrdinal("UNM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Nombre")),
                     UNM_NombreCorto = lector.IsDBNull(lector.GetOrdinal("UNM_NombreCorto")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_NombreCorto")),
                     Estado = lector.IsDBNull(lector.GetOrdinal("UNM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Estado")),
                     UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioCreacion")),
                     FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraCreacion")),
                     UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioModificacion")),
                     FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraModificacion"))
                 });
             }
         }
         comando.Dispose();
         return entidades;
     }


     #endregion

    
 }
}
