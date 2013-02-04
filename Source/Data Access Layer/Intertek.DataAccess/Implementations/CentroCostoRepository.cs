using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class CentroCostoRepository : Repository, ICentroCostoRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public IList<CentroCosto> GetAll()
        {
            var entidades = new List<CentroCosto>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllCentroCosto");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new CentroCosto
                                      {
                                          IDCentroCosto =
                                              lector.IsDBNull(lector.GetOrdinal("IDCentroCosto"))
                                                  ? default(int)
                                                  : lector.GetInt32(lector.GetOrdinal("IDCentroCosto")),
                                          CCO_Codigo =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Codigo"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Codigo")),
                                          CCO_Nombre =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Nombre"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Nombre")),
                                          CCO_Descripcion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Descripcion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Descripcion")),
                                          Estado =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Estado"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Estado")),
                                          UsuarioCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_UsuarioCreacion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_UsuarioCreacion")),
                                          FechaHoraCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_FechaHoraCreacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CCO_FechaHoraCreacion")),
                                          UsuarioModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_UsuarioModificacion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_UsuarioModificacion")),
                                          FechaHoraModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_FechaHoraModificacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CCO_FechaHoraModificacion"))
                                      });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<CentroCosto> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            IList<CentroCosto> entidades = new List<CentroCosto>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationCentroCosto");
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
                        var entidad = new CentroCosto();
                        entidad.IDCentroCosto = lector.IsDBNull(lector.GetOrdinal("IDCentroCosto"))
                                                    ? default(int)
                                                    : lector.GetInt32(lector.GetOrdinal("IDCentroCosto"));
                        entidad.CCO_Codigo = lector.IsDBNull(lector.GetOrdinal("CCO_Codigo"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CCO_Codigo"));
                        entidad.CCO_Nombre = lector.IsDBNull(lector.GetOrdinal("CCO_Nombre"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CCO_Nombre"));
                        entidad.CCO_Descripcion = lector.IsDBNull(lector.GetOrdinal("CCO_Descripcion"))
                                                      ? default(string)
                                                      : lector.GetString(lector.GetOrdinal("CCO_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("CCO_Estado"))
                                             ? default(string)
                                             : lector.GetString(lector.GetOrdinal("CCO_Estado"));
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

        public CentroCosto Single(int id)
        {
            var centroCosto = default(CentroCosto);
            var comando = BaseDatos.GetStoredProcCommand("SelectCentroCosto");

            BaseDatos.AddInParameter(comando, "IDCentroCosto", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    centroCosto = new CentroCosto
                                      {
                                          IDCentroCosto =
                                              lector.IsDBNull(lector.GetOrdinal("IDCentroCosto"))
                                                  ? default(int)
                                                  : lector.GetInt32(lector.GetOrdinal("IDCentroCosto")),
                                          CCO_Codigo =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Codigo"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Codigo")),
                                          CCO_Nombre =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Nombre"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Nombre")),
                                          CCO_Descripcion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Descripcion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Descripcion")),
                                          Estado =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_Estado"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_Estado")),
                                          UsuarioCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_UsuarioCreacion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_UsuarioCreacion")),
                                          FechaHoraCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_FechaHoraCreacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CCO_FechaHoraCreacion")),
                                          UsuarioModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_UsuarioModificacion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CCO_UsuarioModificacion")),
                                          FechaHoraModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CCO_FechaHoraModificacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CCO_FechaHoraModificacion"))
                                      };
                }
            }
            comando.Dispose();
            return centroCosto;
        }

        public int Count(string where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountCentroCosto");

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

        public int Add(CentroCosto centroCosto)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertCentroCosto");
            BaseDatos.AddOutParameter(comando, "IDCentroCosto", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "CCO_Codigo", DbType.String, centroCosto.CCO_Codigo);
            BaseDatos.AddInParameter(comando, "CCO_Nombre", DbType.String, centroCosto.CCO_Nombre);
            BaseDatos.AddInParameter(comando, "CCO_Descripcion", DbType.String, centroCosto.CCO_Descripcion);
            BaseDatos.AddInParameter(comando, "CCO_Estado", DbType.String, centroCosto.Estado);
            BaseDatos.AddInParameter(comando, "CCO_UsuarioCreaccion", DbType.String, centroCosto.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "CCO_UsuarioModificacion", DbType.String, centroCosto.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar CentroCosto.");

            var valorDevuelto = (int) BaseDatos.GetParameterValue(comando, "IDCentroCosto");
            
            comando.Dispose();
            return valorDevuelto;
        }

        public int Update(CentroCosto centroCosto)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateCentroCosto");
            BaseDatos.AddInParameter(comando, "IDCentroCosto", DbType.Int32, centroCosto.IDCentroCosto);
            BaseDatos.AddInParameter(comando, "CCO_Codigo", DbType.String, centroCosto.CCO_Codigo);
            BaseDatos.AddInParameter(comando, "CCO_Nombre", DbType.String, centroCosto.CCO_Nombre);
            BaseDatos.AddInParameter(comando, "CCO_Descripcion", DbType.String, centroCosto.CCO_Descripcion);
            BaseDatos.AddInParameter(comando, "CCO_Estado", DbType.String, centroCosto.Estado);
            //BaseDatos.AddInParameter(comando, "CCO_UsuarioCreaccion", DbType.String, centroCosto.UsuarioCreacion);
            //BaseDatos.AddInParameter(comando, "CCO_FechaHoraCreacion", DbType.DateTime, centroCosto.FechaHoraCreacion);
            BaseDatos.AddInParameter(comando, "CCO_UsuarioModificacion", DbType.String, centroCosto.UsuarioModificacion);
            //BaseDatos.AddInParameter(comando, "CCO_FechaHoraModificacion", DbType.DateTime,
            //                         centroCosto.FechaHoraModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar CentroCosto.");

            comando.Dispose();
            return resultado;
        }

        public int Delete(int id)
        {
            var comando = BaseDatos.GetStoredProcCommand("DeleteCentroCosto");
            BaseDatos.AddInParameter(comando, "IDCentroCosto", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar CentroCosto.");
            comando.Dispose();
            return 1;
        }

        #endregion Metodos Publicos

        #endregion Métodos
    }
}
