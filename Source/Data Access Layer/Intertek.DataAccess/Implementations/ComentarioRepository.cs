using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class ComentarioRepository:Repository,IComentarioRepository
    {

        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(Comentario area)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertComentario");
            BaseDatos.AddOutParameter(comando, "IDComentario", DbType.Int32, 4);
            BaseDatos.AddInParameter(comando, "COM_Codigo", DbType.String, area.COM_Codigo);
            BaseDatos.AddInParameter(comando, "COM_Nombre", DbType.String, area.COM_Nombre);
            BaseDatos.AddInParameter(comando, "COM_Descripcion", DbType.String, area.COM_Descripcion);
            BaseDatos.AddInParameter(comando, "COM_Estado", DbType.String, area.Estado);
            BaseDatos.AddInParameter(comando, "COM_UsuarioCreaccion", DbType.String, area.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "COM_UsuarioModificacion", DbType.String, area.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Comentario.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDComentario"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountComentario");

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
            var comando = BaseDatos.GetStoredProcCommand("DeleteComentario");
            BaseDatos.AddInParameter(comando, "IdComentario", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Comentario.");
            comando.Dispose();
            return 1;
        }

        public int Update(Comentario area)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateComentario");
            BaseDatos.AddInParameter(comando, "IDComentario", DbType.Int32, area.IDComentario);
            BaseDatos.AddInParameter(comando, "COM_Codigo", DbType.String, area.COM_Codigo);
            BaseDatos.AddInParameter(comando, "COM_Nombre", DbType.String, area.COM_Nombre);
            BaseDatos.AddInParameter(comando, "COM_Descripcion", DbType.String, area.COM_Descripcion);
            BaseDatos.AddInParameter(comando, "COM_Estado", DbType.String, area.Estado);
            BaseDatos.AddInParameter(comando, "COM_UsuarioModificacion", DbType.String, area.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Comentario.");

            comando.Dispose();
            return resultado;
        }

        public Comentario Single(int id)
        {
            var area = default(Comentario);
            var comando = BaseDatos.GetStoredProcCommand("SelectComentario");

            BaseDatos.AddInParameter(comando, "IDComentario", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    area = new Comentario
                    {
                        IDComentario = lector.IsDBNull(lector.GetOrdinal("IDComentario")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDComentario")),
                        COM_Codigo = lector.IsDBNull(lector.GetOrdinal("COM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Codigo")),
                        COM_Nombre = lector.IsDBNull(lector.GetOrdinal("COM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Nombre")),
                        COM_Descripcion = lector.IsDBNull(lector.GetOrdinal("COM_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("COM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("COM_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("COM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COM_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("COM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("COM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COM_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return area;
        }

        public IList<Comentario> GetAll()
        {
            var entidades = new List<Comentario>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllComentario");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Comentario
                    {
                        IDComentario = lector.IsDBNull(lector.GetOrdinal("IDComentario")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDComentario")),
                        COM_Codigo = lector.IsDBNull(lector.GetOrdinal("COM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Codigo")),
                        COM_Nombre = lector.IsDBNull(lector.GetOrdinal("COM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Nombre")),
                        COM_Descripcion = lector.IsDBNull(lector.GetOrdinal("COM_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("COM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("COM_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("COM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COM_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("COM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("COM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COM_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Comentario> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Comentario> entidades = new List<Comentario>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationComentario");
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
                        var entidad = new Comentario();
                        entidad.IDComentario = lector.IsDBNull(lector.GetOrdinal("IDComentario")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDComentario"));
                        entidad.COM_Codigo = lector.IsDBNull(lector.GetOrdinal("COM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Codigo"));
                        entidad.COM_Nombre = lector.IsDBNull(lector.GetOrdinal("COM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Nombre"));
                        entidad.COM_Descripcion = lector.IsDBNull(lector.GetOrdinal("COM_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("COM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("COM_Estado"));
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
