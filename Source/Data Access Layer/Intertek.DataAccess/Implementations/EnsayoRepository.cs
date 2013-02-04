using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class EnsayoRepository:Repository,IEnsayoRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(Ensayo ensayo)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertEnsayo");
            BaseDatos.AddOutParameter(comando, "IDEnsayo", DbType.Int32, 4);
            BaseDatos.AddInParameter(comando, "ENS_Codigo", DbType.String, ensayo.ENS_Codigo);
            BaseDatos.AddInParameter(comando, "ENS_Nombre", DbType.String, ensayo.ENS_Nombre);
            BaseDatos.AddInParameter(comando, "ENS_NombreIngles", DbType.String, ensayo.ENS_NombreIngles);
            BaseDatos.AddInParameter(comando, "ENS_Estado", DbType.String, ensayo.Estado);
            BaseDatos.AddInParameter(comando, "IDLaboratorio", DbType.Int32, ensayo.IDLaboratorio);
            BaseDatos.AddInParameter(comando, "ENS_Descripcion", DbType.String, ensayo.ENS_Descripcion);
            BaseDatos.AddInParameter(comando, "ENS_UsuarioCreaccion", DbType.String, ensayo.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "ENS_UsuarioModificacion", DbType.String, ensayo.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Ensayo.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDEnsayo"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountEnsayo");

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
            var comando = BaseDatos.GetStoredProcCommand("DeleteEnsayo");
            BaseDatos.AddInParameter(comando, "IDEnsayo", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Ensayo.");
            comando.Dispose();
            return 1;
        }

        public int Update(Ensayo ensayo)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateEnsayo");
            BaseDatos.AddInParameter(comando, "IDEnsayo", DbType.Int32, ensayo.IDEnsayo);
            BaseDatos.AddInParameter(comando, "ENS_Codigo", DbType.String, ensayo.ENS_Codigo);
            BaseDatos.AddInParameter(comando, "ENS_Nombre", DbType.String, ensayo.ENS_Nombre);
            BaseDatos.AddInParameter(comando, "ENS_NombreIngles", DbType.String, ensayo.ENS_NombreIngles);
            BaseDatos.AddInParameter(comando, "ENS_Estado", DbType.String, ensayo.Estado);
            BaseDatos.AddInParameter(comando, "IDLaboratorio", DbType.Int32, ensayo.IDLaboratorio);
            BaseDatos.AddInParameter(comando, "ENS_Descripcion", DbType.String, ensayo.ENS_Descripcion);
            BaseDatos.AddInParameter(comando, "ENS_UsuarioModificacion", DbType.String, ensayo.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Ensayo.");

            comando.Dispose();
            return resultado;
        }

        public Ensayo Single(int id)
        {
            var ensayo = default(Ensayo);
            var comando = BaseDatos.GetStoredProcCommand("SelectEnsayo");

            BaseDatos.AddInParameter(comando, "IDEnsayo", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    ensayo = new Ensayo
                    {
                        IDEnsayo = lector.IsDBNull(lector.GetOrdinal("IDEnsayo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDEnsayo")),
                        ENS_Codigo = lector.IsDBNull(lector.GetOrdinal("ENS_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Codigo")),
                        ENS_Nombre = lector.IsDBNull(lector.GetOrdinal("ENS_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Nombre")),
                        ENS_NombreIngles = lector.IsDBNull(lector.GetOrdinal("ENS_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_NombreIngles")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("ENS_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Estado")),
                        IDLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDLaboratorio")),
                        ENS_Descripcion = lector.IsDBNull(lector.GetOrdinal("ENS_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Descripcion")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("ENS_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("ENS_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ENS_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("ENS_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("ENS_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ENS_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return ensayo;
        }

        public IList<Ensayo> GetAll()
        {
            var entidades = new List<Ensayo>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllEnsayo");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Ensayo
                    {
                        IDEnsayo = lector.IsDBNull(lector.GetOrdinal("IDEnsayo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDEnsayo")),
                        ENS_Codigo = lector.IsDBNull(lector.GetOrdinal("ENS_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Codigo")),
                        ENS_Nombre = lector.IsDBNull(lector.GetOrdinal("ENS_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Nombre")),
                        ENS_NombreIngles = lector.IsDBNull(lector.GetOrdinal("ENS_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_NombreIngles")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("ENS_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Estado")),
                        IDLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDLaboratorio")),
                        ENS_Descripcion = lector.IsDBNull(lector.GetOrdinal("ENS_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Descripcion")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("ENS_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("ENS_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ENS_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("ENS_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("ENS_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ENS_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Ensayo> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Ensayo> entidades = new List<Ensayo>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationEnsayo");
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
                        var entidad = new Ensayo();
                        entidad.IDEnsayo = lector.IsDBNull(lector.GetOrdinal("IDEnsayo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDEnsayo"));
                        entidad.ENS_Codigo = lector.IsDBNull(lector.GetOrdinal("ENS_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Codigo"));
                        entidad.ENS_Nombre = lector.IsDBNull(lector.GetOrdinal("ENS_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Nombre"));
                        entidad.ENS_NombreIngles = lector.IsDBNull(lector.GetOrdinal("ENS_NombreIngles")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_NombreIngles"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("ENS_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Estado"));
                        entidad.IDLaboratorio = lector.IsDBNull(lector.GetOrdinal("IDLaboratorio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDLaboratorio"));
                        entidad.ENS_Descripcion = lector.IsDBNull(lector.GetOrdinal("ENS_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("ENS_Descripcion"));

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
