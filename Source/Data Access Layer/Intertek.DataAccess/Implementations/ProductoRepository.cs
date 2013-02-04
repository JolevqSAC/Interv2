using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class ProductoRepository : Repository, IProductoRepository
    {

        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(Producto producto)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertProducto");
            BaseDatos.AddOutParameter(comando, "IDProducto", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "IDUnidadMedida", DbType.Int32, producto.IDUnidadMedida);
            BaseDatos.AddInParameter(comando, "PRO_Codigo", DbType.String, producto.PRO_Codigo);
            BaseDatos.AddInParameter(comando, "PRO_Nombre", DbType.String, producto.PRO_Nombre);
            BaseDatos.AddInParameter(comando, "PRO_NombreIngles", DbType.String, producto.PRO_NombreIngles);
            BaseDatos.AddInParameter(comando, "PRO_Descripcion", DbType.String, producto.PRO_Descripcion);
            BaseDatos.AddInParameter(comando, "PRO_Estado", DbType.String, producto.Estado);
            BaseDatos.AddInParameter(comando, "PRO_UsuarioCreaccion", DbType.String, producto.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "PRO_UsuarioModificacion", DbType.String, producto.UsuarioModificacion);
            BaseDatos.AddInParameter(comando, "IDCategoria", DbType.Int32, producto.IDCategoria);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Producto.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDProducto"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountProducto");

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
            var comando = BaseDatos.GetStoredProcCommand("DeleteProducto");
            BaseDatos.AddInParameter(comando, "IDProducto", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Producto.");
            comando.Dispose();
            return 1;
        }

        public int Update(Producto producto)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateProducto");
            BaseDatos.AddInParameter(comando, "IDProducto", DbType.Int32, producto.IDProducto);
            BaseDatos.AddInParameter(comando, "IDUnidadMedida", DbType.Int32, producto.IDUnidadMedida);
            BaseDatos.AddInParameter(comando, "PRO_Codigo", DbType.String, producto.PRO_Codigo);
            BaseDatos.AddInParameter(comando, "PRO_Nombre", DbType.String, producto.PRO_Nombre);
            BaseDatos.AddInParameter(comando, "PRO_NombreIngles", DbType.String, producto.PRO_NombreIngles);
            BaseDatos.AddInParameter(comando, "PRO_Descripcion", DbType.String, producto.PRO_Descripcion);
            BaseDatos.AddInParameter(comando, "PRO_Estado", DbType.String, producto.Estado);
            BaseDatos.AddInParameter(comando, "PRO_UsuarioModificacion", DbType.String, producto.UsuarioModificacion);
            BaseDatos.AddInParameter(comando, "IDCategoria", DbType.Int32, producto.IDCategoria);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Producto.");

            comando.Dispose();
            return resultado;
        }

        public Producto Single(int id)
        {
            var area = default(Producto);
            var comando = BaseDatos.GetStoredProcCommand("SelectProducto");

            BaseDatos.AddInParameter(comando, "IDProducto", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    area = new Producto
                    {
                        IDProducto = lector.IsDBNull(lector.GetOrdinal("IDProducto")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDProducto")),
                        IDUnidadMedida = lector.IsDBNull(lector.GetOrdinal("IDUnidadMedida")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDUnidadMedida")),
                        PRO_Codigo = lector.IsDBNull(lector.GetOrdinal("PRO_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Codigo")),
                        PRO_Nombre = lector.IsDBNull(lector.GetOrdinal("PRO_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Nombre")),
                        PRO_NombreIngles = lector.IsDBNull(lector.GetOrdinal("PRO_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_NombreIngles")),
                        PRO_Descripcion = lector.IsDBNull(lector.GetOrdinal("PRO_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("PRO_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("PRO_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("PRO_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PRO_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("PRO_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("PRO_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PRO_FechaHoraModificacion")),
                        IDCategoria = lector.IsDBNull(lector.GetOrdinal("IDCategoria")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCategoria"))

                    };
                }
            }
            comando.Dispose();
            return area;
        }

        public IList<Producto> GetAll()
        {
            var entidades = new List<Producto>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllProducto");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Producto
                    {
                        IDProducto = lector.IsDBNull(lector.GetOrdinal("IDProducto")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDProducto")),
                        IDUnidadMedida = lector.IsDBNull(lector.GetOrdinal("IDUnidadMedida")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDUnidadMedida")),
                        PRO_Codigo = lector.IsDBNull(lector.GetOrdinal("PRO_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Codigo")),
                        PRO_Nombre = lector.IsDBNull(lector.GetOrdinal("PRO_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Nombre")),
                        PRO_NombreIngles = lector.IsDBNull(lector.GetOrdinal("PRO_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_NombreIngles")),
                        PRO_Descripcion = lector.IsDBNull(lector.GetOrdinal("PRO_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("PRO_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("PRO_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("PRO_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PRO_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("PRO_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("PRO_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PRO_FechaHoraModificacion")),
                        IDCategoria = lector.IsDBNull(lector.GetOrdinal("IDCategoria")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCategoria"))

                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Producto> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Producto> entidades = new List<Producto>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationProducto");
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
                        var entidad = new Producto();
                        entidad.IDProducto = lector.IsDBNull(lector.GetOrdinal("IDProducto")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDProducto"));
                        entidad.IDUnidadMedida = lector.IsDBNull(lector.GetOrdinal("IDUnidadMedida")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDUnidadMedida"));
                        entidad.PRO_Codigo = lector.IsDBNull(lector.GetOrdinal("PRO_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Codigo"));
                        entidad.PRO_Nombre = lector.IsDBNull(lector.GetOrdinal("PRO_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Nombre"));
                        entidad.PRO_NombreIngles = lector.IsDBNull(lector.GetOrdinal("PRO_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_NombreIngles"));
                        entidad.PRO_Descripcion = lector.IsDBNull(lector.GetOrdinal("PRO_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("PRO_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Estado"));
                        entidad.IDCategoria = lector.IsDBNull(lector.GetOrdinal("IDCategoria")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCategoria"));

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
