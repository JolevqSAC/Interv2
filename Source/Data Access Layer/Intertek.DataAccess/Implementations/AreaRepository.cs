using System;
using System.Collections.Generic;
using System.Data;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class AreaRepository : Repository, IAreaRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(Area area)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertArea");
            BaseDatos.AddOutParameter(comando, "IDArea", DbType.Int32, 4);
            BaseDatos.AddInParameter(comando, "ARE_Codigo", DbType.String, area.ARE_Codigo);
            BaseDatos.AddInParameter(comando, "ARE_Nombre", DbType.String, area.ARE_Nombre);
            BaseDatos.AddInParameter(comando, "ARE_Descripcion", DbType.String, area.ARE_Descripcion);
            BaseDatos.AddInParameter(comando, "ARE_Estado", DbType.String, area.Estado);
            BaseDatos.AddInParameter(comando, "ARE_UsuarioCreaccion", DbType.String, area.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "ARE_UsuarioModificacion", DbType.String, area.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Area.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDArea"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountArea");

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
            var comando = BaseDatos.GetStoredProcCommand("DeleteArea");
            BaseDatos.AddInParameter(comando, "IdArea", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Area.");
            comando.Dispose();
            return 1;
        }

        public int Update(Area area)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateArea");
            BaseDatos.AddInParameter(comando, "IDArea", DbType.Int32, area.IDArea);
            BaseDatos.AddInParameter(comando, "ARE_Codigo", DbType.String, area.ARE_Codigo);
            BaseDatos.AddInParameter(comando, "ARE_Nombre", DbType.String, area.ARE_Nombre);
            BaseDatos.AddInParameter(comando, "ARE_Descripcion", DbType.String, area.ARE_Descripcion);
            BaseDatos.AddInParameter(comando, "ARE_Estado", DbType.String, area.Estado);
            BaseDatos.AddInParameter(comando, "ARE_UsuarioModificacion", DbType.String, area.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Area.");

            comando.Dispose();
            return resultado;
        }

        public Area Single(int id)
        {
            var area = default(Area);
            var comando = BaseDatos.GetStoredProcCommand("SelectArea");

            BaseDatos.AddInParameter(comando, "IDArea", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    area = new Area
                    {
                        IDArea = lector.IsDBNull(lector.GetOrdinal("IDArea")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDArea")),
                        ARE_Codigo = lector.IsDBNull(lector.GetOrdinal("ARE_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Codigo")),
                        ARE_Nombre = lector.IsDBNull(lector.GetOrdinal("ARE_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Nombre")),
                        ARE_Descripcion = lector.IsDBNull(lector.GetOrdinal("ARE_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("ARE_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("ARE_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("ARE_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ARE_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("ARE_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("ARE_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ARE_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return area;
        }

        public IList<Area> GetAll()
        {
            var entidades = new List<Area>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllArea");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Area
                    {
                        IDArea = lector.IsDBNull(lector.GetOrdinal("IDArea")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDArea")),
                        ARE_Codigo = lector.IsDBNull(lector.GetOrdinal("ARE_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Codigo")),
                        ARE_Nombre = lector.IsDBNull(lector.GetOrdinal("ARE_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Nombre")),
                        ARE_Descripcion = lector.IsDBNull(lector.GetOrdinal("ARE_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("ARE_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("ARE_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("ARE_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ARE_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("ARE_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("ARE_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ARE_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Area> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Area> entidades = new List<Area>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationArea");
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
                        var entidad = new Area();
                        entidad.IDArea = lector.IsDBNull(lector.GetOrdinal("IDArea")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDArea"));
                        entidad.ARE_Codigo = lector.IsDBNull(lector.GetOrdinal("ARE_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Codigo"));
                        entidad.ARE_Nombre = lector.IsDBNull(lector.GetOrdinal("ARE_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Nombre"));
                        entidad.ARE_Descripcion = lector.IsDBNull(lector.GetOrdinal("ARE_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("ARE_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("ARE_Estado"));
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
