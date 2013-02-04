using System;
using System.Collections.Generic;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
    public class ServicioRepository : Repository, IServicioRepository
    {
        public IList<Servicio> GetAll()
        {

            var entidades = new List<Servicio>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllServicio");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Servicio
                    {
                        IDServicio = lector.IsDBNull(lector.GetOrdinal("IDServicio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDServicio")),
                        SER_Codigo = lector.IsDBNull(lector.GetOrdinal("SER_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Codigo")),
                        SER_Nombre = lector.IsDBNull(lector.GetOrdinal("SER_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Nombre")),
                        SER_NombreIngles = lector.IsDBNull(lector.GetOrdinal("SER_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_NombreIngles")),
                        SER_Descripcion = lector.IsDBNull(lector.GetOrdinal("SER_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("SER_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("SER_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("SER_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("SER_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("SER_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("SER_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("SER_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;




        }

        public IList<Servicio> GetAll(string sidx, string sord, int rows, int page, string where)
        {

            IList<Servicio> entidades = new List<Servicio>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationServicio");
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
                        var entidad = new Servicio();
                        entidad.IDServicio = lector.IsDBNull(lector.GetOrdinal("IDServicio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDServicio"));
                        entidad.SER_Codigo = lector.IsDBNull(lector.GetOrdinal("SER_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Codigo"));
                        entidad.SER_Nombre = lector.IsDBNull(lector.GetOrdinal("SER_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Nombre"));
                        entidad.SER_NombreIngles = lector.IsDBNull(lector.GetOrdinal("SER_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_NombreIngles"));
                        entidad.SER_Descripcion = lector.IsDBNull(lector.GetOrdinal("SER_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("SER_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Estado"));
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

        public Servicio Single(int id)
        {

            var servicio = default(Servicio);
            var comando = BaseDatos.GetStoredProcCommand("SelectServicio");

            BaseDatos.AddInParameter(comando, "IDServicio", DbType.Int32, id);

            using (var  lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    servicio = new Servicio
                    {
                        IDServicio = lector.IsDBNull(lector.GetOrdinal("IDServicio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDServicio")),
                        SER_Codigo = lector.IsDBNull(lector.GetOrdinal("SER_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Codigo")),
                        SER_Nombre = lector.IsDBNull(lector.GetOrdinal("SER_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Nombre")),
                        SER_NombreIngles = lector.IsDBNull(lector.GetOrdinal("SER_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_NombreIngles")),
                        SER_Descripcion = lector.IsDBNull(lector.GetOrdinal("SER_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("SER_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("SER_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("SER_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("SER_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("SER_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("SER_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("SER_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("SER_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return servicio;
        }

        public int Count(string where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountServicio");

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

        public int Add(Servicio servicio)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertServicio");
            BaseDatos.AddOutParameter(comando, "IDServicio", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "SER_Codigo", DbType.String, servicio.SER_Codigo);
            BaseDatos.AddInParameter(comando, "SER_Nombre", DbType.String, servicio.SER_Nombre);
            BaseDatos.AddInParameter(comando, "SER_Descripcion", DbType.String, servicio.SER_Descripcion);
            BaseDatos.AddInParameter(comando, "SER_NombreIngles", DbType.String, servicio.SER_NombreIngles);
            BaseDatos.AddInParameter(comando, "SER_Estado", DbType.String, servicio.Estado);
            BaseDatos.AddInParameter(comando, "SER_UsuarioCreaccion", DbType.String, servicio.UsuarioCreacion);
           // BaseDatos.AddInParameter(comando, "SER_FechaHoraCreacion", DbType.DateTime, servicio.FechaHoraCreacion);
            BaseDatos.AddInParameter(comando, "SER_UsuarioModificacion", DbType.String, servicio.UsuarioModificacion);
          //  BaseDatos.AddInParameter(comando, "SER_FechaHoraModificacion", DbType.DateTime, servicio.FechaHoraModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Servicio.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDServicio"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Update(Servicio servicio)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateServicio");
            BaseDatos.AddInParameter(comando, "IDServicio", DbType.Int32, servicio.IDServicio);
            BaseDatos.AddInParameter(comando, "SER_Codigo", DbType.String, servicio.SER_Codigo);
            BaseDatos.AddInParameter(comando, "SER_Nombre", DbType.String, servicio.SER_Nombre);
            BaseDatos.AddInParameter(comando, "SER_Descripcion", DbType.String, servicio.SER_Descripcion);
            BaseDatos.AddInParameter(comando, "SER_NombreIngles", DbType.String, servicio.SER_NombreIngles);
            BaseDatos.AddInParameter(comando, "SER_Estado", DbType.String, servicio.Estado);
         //   BaseDatos.AddInParameter(comando, "SER_UsuarioCreaccion", DbType.String, servicio.UsuarioCreacion);
           // BaseDatos.AddInParameter(comando, "SER_FechaHoraCreacion", DbType.DateTime, servicio.FechaHoraCreacion);
            BaseDatos.AddInParameter(comando, "SER_UsuarioModificacion", DbType.String, servicio.UsuarioModificacion);
          //  BaseDatos.AddInParameter(comando, "SER_FechaHoraModificacion", DbType.DateTime, servicio.FechaHoraModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Servicio.");

            comando.Dispose();
            return resultado;
        }

        public int Delete(int id)
        {
            var comando = BaseDatos.GetStoredProcCommand("DeleteServicio");
            BaseDatos.AddInParameter(comando, "IdServicio", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Servicio.");
            comando.Dispose();
            return resultado;
        }
    }
}
