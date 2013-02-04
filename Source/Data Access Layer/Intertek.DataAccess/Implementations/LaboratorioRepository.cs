using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
   public class LaboratorioRepository:Repository,ILaboratorioRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(Laboratorio laboratorio)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertLaboratorio");
            BaseDatos.AddOutParameter(comando, "IDLaboratorio", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "LAB_Nombre", DbType.String, laboratorio.LAB_Nombre);
            BaseDatos.AddInParameter(comando, "IDTipoLaboratorio", DbType.Int32, laboratorio.IDTipoLaboratorio);
            BaseDatos.AddInParameter(comando, "LAB_Estado", DbType.String, laboratorio.Estado);
            BaseDatos.AddInParameter(comando, "LAB_UsuarioCreaccion", DbType.String, laboratorio.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "LAB_UsuarioModificacion", DbType.String, laboratorio.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Laboratorio.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDLaboratorio"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountLaboratorio");

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
            var comando = BaseDatos.GetStoredProcCommand("DeleteLaboratorio");
            BaseDatos.AddInParameter(comando, "IDLaboratorio", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Laboratorio.");
            comando.Dispose();
            return 1;
        }

        public int Update(Laboratorio laboratorio)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateLaboratorio");
            BaseDatos.AddInParameter(comando, "IDLaboratorio", DbType.Int32, laboratorio.IDLaboratorio);
            BaseDatos.AddInParameter(comando, "LAB_Nombre", DbType.String, laboratorio.LAB_Nombre);
            BaseDatos.AddInParameter(comando, "IDTipoLaboratorio", DbType.Int32, laboratorio.IDTipoLaboratorio);
            BaseDatos.AddInParameter(comando, "LAB_Estado", DbType.String, laboratorio.Estado);
            BaseDatos.AddInParameter(comando, "LAB_UsuarioModificacion", DbType.String, laboratorio.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Laboratorio.");

            comando.Dispose();
            return resultado;
        }

        public Laboratorio Single(int id)
        {
            var area = default(Laboratorio);
            var comando = BaseDatos.GetStoredProcCommand("SelectLaboratorio");

            BaseDatos.AddInParameter(comando, "IDLaboratorio", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    area = new Laboratorio
                    {
                        IDLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDLaboratorio")),
                        LAB_Nombre = lector.IsDBNull(lector.GetOrdinal("LAB_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_Nombre")),
                        IDTipoLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDTipoLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDTipoLaboratorio")),
                        NombreTipoLaboratorio = lector.IsDBNull(lector.GetOrdinal("TLA_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("TLA_Nombre")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("LAB_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("LAB_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("LAB_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("LAB_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("LAB_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("LAB_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("LAB_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return area;
        }

        public IList<Laboratorio> GetAll()
        {
            var entidades = new List<Laboratorio>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllLaboratorio");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Laboratorio
                    {
                        IDLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDLaboratorio")),
                        LAB_Nombre = lector.IsDBNull(lector.GetOrdinal("LAB_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_Nombre")),
                        IDTipoLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDTipoLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDTipoLaboratorio")),
                        NombreTipoLaboratorio = lector.IsDBNull(lector.GetOrdinal("TLA_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("TLA_Nombre")),                        
                        Estado = lector.IsDBNull(lector.GetOrdinal("LAB_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("LAB_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("LAB_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("LAB_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("LAB_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("LAB_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("LAB_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Laboratorio> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Laboratorio> entidades = new List<Laboratorio>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationLaboratorio");
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
                        var entidad = new Laboratorio();
                        entidad.IDLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDLaboratorio"));
                        entidad.LAB_Nombre = lector.IsDBNull(lector.GetOrdinal("LAB_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_Nombre"));
                        entidad.IDTipoLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDTipoLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDTipoLaboratorio"));
                        entidad.NombreTipoLaboratorio = lector.IsDBNull(lector.GetOrdinal("TLA_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("TLA_Nombre"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("LAB_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("LAB_Estado"));
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
