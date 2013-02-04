using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
   public class MetodoRepository:Repository,IMetodoRepository
    {

        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(Metodo metodo)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertMetodo");
            BaseDatos.AddOutParameter(comando, "IDMetodo", DbType.Int32, 4);
            BaseDatos.AddInParameter(comando, "MET_Codigo", DbType.String, metodo.MET_Codigo);
            BaseDatos.AddInParameter(comando, "MET_Nombre", DbType.String, metodo.MET_Nombre);
            BaseDatos.AddInParameter(comando, "MET_NombreIngles", DbType.String, metodo.MET_NombreIngles);
            BaseDatos.AddInParameter(comando, "MET_Descripcion", DbType.String, metodo.MET_Descripcion);
            BaseDatos.AddInParameter(comando, "MET_Estado", DbType.String, metodo.Estado);
            BaseDatos.AddInParameter(comando, "MET_UsuarioCreaccion", DbType.String, metodo.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "MET_UsuarioModificacion", DbType.String, metodo.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Metodo.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDMetodo"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountMetodo");

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

        public int Delete(int id)
        {
            var comando = BaseDatos.GetStoredProcCommand("DeleteMetodo");
            BaseDatos.AddInParameter(comando, "IDMetodo", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Metodo.");
            comando.Dispose();
            return 1;
        }

        public int Update(Metodo metodo)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateMetodo");
            BaseDatos.AddInParameter(comando, "IDMetodo", DbType.Int32, metodo.IDMetodo);
            BaseDatos.AddInParameter(comando, "MET_Codigo", DbType.String, metodo.MET_Codigo);
            BaseDatos.AddInParameter(comando, "MET_Nombre", DbType.String, metodo.MET_Nombre);
            BaseDatos.AddInParameter(comando, "MET_NombreIngles", DbType.String, metodo.MET_NombreIngles);
            BaseDatos.AddInParameter(comando, "MET_Descripcion", DbType.String, metodo.MET_Descripcion);
            BaseDatos.AddInParameter(comando, "MET_Estado", DbType.String, metodo.Estado);
            BaseDatos.AddInParameter(comando, "MET_UsuarioModificacion", DbType.String, metodo.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Metodo.");

            comando.Dispose();
            return resultado;
        }

        public Metodo Single(int id)
        {
            var area = default(Metodo);
            var comando = BaseDatos.GetStoredProcCommand("SelectMetodo");

            BaseDatos.AddInParameter(comando, "IDMetodo", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    area = new Metodo
                    {
                        IDMetodo = lector.IsDBNull(lector.GetOrdinal("IDMetodo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDMetodo")),
                        MET_Codigo = lector.IsDBNull(lector.GetOrdinal("MET_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Codigo")),
                        MET_Nombre = lector.IsDBNull(lector.GetOrdinal("MET_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Nombre")),
                        MET_NombreIngles = lector.IsDBNull(lector.GetOrdinal("MET_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_NombreIngles")),
                        MET_Descripcion = lector.IsDBNull(lector.GetOrdinal("MET_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("MET_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("MET_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("MET_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("MET_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("MET_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("MET_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("MET_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return area;
        }

        public IList<Metodo> GetAll()
        {
            var entidades = new List<Metodo>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllMetodo");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Metodo
                    {
                        IDMetodo = lector.IsDBNull(lector.GetOrdinal("IDMetodo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDMetodo")),
                        MET_Codigo = lector.IsDBNull(lector.GetOrdinal("MET_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Codigo")),
                        MET_Nombre = lector.IsDBNull(lector.GetOrdinal("MET_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Nombre")),
                        MET_NombreIngles = lector.IsDBNull(lector.GetOrdinal("MET_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_NombreIngles")),
                        MET_Descripcion = lector.IsDBNull(lector.GetOrdinal("MET_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("MET_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("MET_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("MET_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("MET_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("MET_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("MET_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("MET_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Metodo> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Metodo> entidades = new List<Metodo>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationMetodo");
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
                        var entidad = new Metodo();
                        entidad.IDMetodo = lector.IsDBNull(lector.GetOrdinal("IDMetodo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDMetodo"));
                        entidad.MET_Codigo = lector.IsDBNull(lector.GetOrdinal("MET_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Codigo"));
                        entidad.MET_Nombre = lector.IsDBNull(lector.GetOrdinal("MET_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Nombre"));
                        entidad.MET_NombreIngles = lector.IsDBNull(lector.GetOrdinal("MET_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_NombreIngles"));
                        entidad.MET_Descripcion = lector.IsDBNull(lector.GetOrdinal("MET_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("MET_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("MET_Estado"));
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

        #endregion Metodos Publicos

        #endregion Métodos

    }
}
