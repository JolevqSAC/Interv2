using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class CategoriaProductoRepository : Repository, ICategoriaProductoRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public IList<CategoriaProducto> GetAll()
        {
            var entidades = new List<CategoriaProducto>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllCategoriaProducto");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new CategoriaProducto
                    {
                        IDCategoria =
                            lector.IsDBNull(lector.GetOrdinal("IDCategoria"))
                                ? default(int)
                                : lector.GetInt32(lector.GetOrdinal("IDCategoria")),
                        CAT_Codigo =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Codigo"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Codigo")),
                        CAT_Nombre =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Nombre"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Nombre")),
                        CAT_NombreIngles =
                            lector.IsDBNull(lector.GetOrdinal("CAT_NombreIngles"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_NombreIngles")),
                        CAT_Descripcion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Descripcion"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Descripcion")),
                        Estado =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Estado"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Estado")),
                        CAT_IndicadorArea =
                            lector.IsDBNull(lector.GetOrdinal("CAT_IndicadorArea"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_IndicadorArea")),
                        UsuarioCreacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_UsuarioCreacion"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_UsuarioCreacion")),
                        FechaHoraCreacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_FechaHoraCreacion"))
                                ? default(DateTime)
                                : lector.GetDateTime(lector.GetOrdinal("CAT_FechaHoraCreacion")),
                        UsuarioModificacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_UsuarioModificacion"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_UsuarioModificacion")),
                        FechaHoraModificacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_FechaHoraModificacion"))
                                ? default(DateTime)
                                : lector.GetDateTime(lector.GetOrdinal("CAT_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<CategoriaProducto> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            IList<CategoriaProducto> entidades = new List<CategoriaProducto>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationCategoriaProducto");
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
                        var entidad = new CategoriaProducto();
                        entidad.IDCategoria = lector.IsDBNull(lector.GetOrdinal("IDCategoria"))
                                                  ? default(int)
                                                  : lector.GetInt32(lector.GetOrdinal("IDCategoria"));
                        entidad.CAT_Codigo = lector.IsDBNull(lector.GetOrdinal("CAT_Codigo"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CAT_Codigo"));
                        entidad.CAT_Nombre = lector.IsDBNull(lector.GetOrdinal("CAT_Nombre"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CAT_Nombre"));
                        entidad.CAT_NombreIngles = lector.IsDBNull(lector.GetOrdinal("CAT_NombreIngles"))
                                                       ? default(string)
                                                       : lector.GetString(lector.GetOrdinal("CAT_NombreIngles"));
                        entidad.CAT_Descripcion = lector.IsDBNull(lector.GetOrdinal("CAT_Descripcion"))
                                                      ? default(string)
                                                      : lector.GetString(lector.GetOrdinal("CAT_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("CAT_Estado"))
                                             ? default(string)
                                             : lector.GetString(lector.GetOrdinal("CAT_Estado"));
                        entidad.CAT_IndicadorArea = lector.IsDBNull(lector.GetOrdinal("CAT_IndicadorArea"))
                                                        ? default(string)
                                                        : lector.GetString(lector.GetOrdinal("CAT_IndicadorArea"));
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

        public CategoriaProducto Single(int id)
        {
            var categoriaProducto = default(CategoriaProducto);
            var comando = BaseDatos.GetStoredProcCommand("SelectCategoriaProducto");

            BaseDatos.AddInParameter(comando, "IDCategoria", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    categoriaProducto = new CategoriaProducto
                    {
                        IDCategoria =
                            lector.IsDBNull(lector.GetOrdinal("IDCategoria"))
                                ? default(int)
                                : lector.GetInt32(lector.GetOrdinal("IDCategoria")),
                        CAT_Codigo =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Codigo"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Codigo")),
                        CAT_Nombre =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Nombre"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Nombre")),
                        CAT_NombreIngles =
                            lector.IsDBNull(lector.GetOrdinal("CAT_NombreIngles"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_NombreIngles")),
                        CAT_Descripcion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Descripcion"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Descripcion")),
                        Estado =
                            lector.IsDBNull(lector.GetOrdinal("CAT_Estado"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_Estado")),
                        CAT_IndicadorArea =
                            lector.IsDBNull(lector.GetOrdinal("CAT_IndicadorArea"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_IndicadorArea")),
                        UsuarioCreacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_UsuarioCreacion"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_UsuarioCreacion")),
                        FechaHoraCreacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_FechaHoraCreacion"))
                                ? default(DateTime)
                                : lector.GetDateTime(lector.GetOrdinal("CAT_FechaHoraCreacion")),
                        UsuarioModificacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_UsuarioModificacion"))
                                ? default(string)
                                : lector.GetString(lector.GetOrdinal("CAT_UsuarioModificacion")),
                        FechaHoraModificacion =
                            lector.IsDBNull(lector.GetOrdinal("CAT_FechaHoraModificacion"))
                                ? default(DateTime)
                                : lector.GetDateTime(
                                    lector.GetOrdinal("CAT_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return categoriaProducto;
        }

        public int Count(string where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountCategoriaProducto");

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

        public int Add(CategoriaProducto categoriaProducto)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertCategoriaProducto");
            BaseDatos.AddOutParameter(comando, "IDCategoria", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "CAT_Codigo", DbType.String, categoriaProducto.CAT_Codigo);
            BaseDatos.AddInParameter(comando, "CAT_Nombre", DbType.String, categoriaProducto.CAT_Nombre);
            BaseDatos.AddInParameter(comando, "CAT_NombreIngles", DbType.String, categoriaProducto.CAT_NombreIngles);
            BaseDatos.AddInParameter(comando, "CAT_Descripcion", DbType.String, categoriaProducto.CAT_Descripcion);
            BaseDatos.AddInParameter(comando, "CAT_Estado", DbType.String, categoriaProducto.Estado);
            BaseDatos.AddInParameter(comando, "CAT_IndicadorArea", DbType.String, categoriaProducto.CAT_IndicadorArea);
            BaseDatos.AddInParameter(comando, "CAT_UsuarioCreaccion", DbType.String, categoriaProducto.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "CAT_UsuarioModificacion", DbType.String,
                                     categoriaProducto.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar CategoriaProducto.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDCategoria");
            comando.Dispose();
            return valorDevuelto;
        }

        public int Update(CategoriaProducto categoriaProducto)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateCategoriaProducto");
            BaseDatos.AddInParameter(comando, "IDCategoria", DbType.Int32, categoriaProducto.IDCategoria);
            BaseDatos.AddInParameter(comando, "CAT_Codigo", DbType.String, categoriaProducto.CAT_Codigo);
            BaseDatos.AddInParameter(comando, "CAT_Nombre", DbType.String, categoriaProducto.CAT_Nombre);
            BaseDatos.AddInParameter(comando, "CAT_NombreIngles", DbType.String, categoriaProducto.CAT_NombreIngles);
            BaseDatos.AddInParameter(comando, "CAT_Descripcion", DbType.String, categoriaProducto.CAT_Descripcion);
            BaseDatos.AddInParameter(comando, "CAT_Estado", DbType.String, categoriaProducto.Estado);
            BaseDatos.AddInParameter(comando, "CAT_IndicadorArea", DbType.String, categoriaProducto.CAT_IndicadorArea);
            //BaseDatos.AddInParameter(comando, "CAT_UsuarioCreaccion", DbType.String, categoriaProducto.UsuarioCreacion);
            //BaseDatos.AddInParameter(comando, "CAT_FechaHoraCreacion", DbType.DateTime,
            //                         categoriaProducto.FechaHoraCreacion);
            BaseDatos.AddInParameter(comando, "CAT_UsuarioModificacion", DbType.String,
                                     categoriaProducto.UsuarioModificacion);
            //BaseDatos.AddInParameter(comando, "CAT_FechaHoraModificacion", DbType.DateTime,
            //                         categoriaProducto.FechaHoraModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar CategoriaProducto.");

            comando.Dispose();
            return resultado;
        }

        public int Delete(int id)
        {
            var comando = BaseDatos.GetStoredProcCommand("DeleteCategoriaProducto");
            BaseDatos.AddInParameter(comando, "IdCategoria", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Categoria.");
            comando.Dispose();
            return 1;
        }

        #endregion Metodos Publicos

        #endregion Métodos

    }
}
