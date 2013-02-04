using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
   public class NormaMuestreoRepository:Repository,INormaMuestreoRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(NormaMuestreo normaMuestreo)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertNormaMuestreo");
            BaseDatos.AddOutParameter(comando, "IDNormaMuestreo", DbType.Int32, 4);
            BaseDatos.AddInParameter(comando, "NOM_Codigo", DbType.String, normaMuestreo.NOM_Codigo);
            BaseDatos.AddInParameter(comando, "NOM_Nombre", DbType.String, normaMuestreo.NOM_Nombre);
            BaseDatos.AddInParameter(comando, "NOM_Acreditador", DbType.String, normaMuestreo.NOM_Acreditador);
            BaseDatos.AddInParameter(comando, "NOM_Anio", DbType.Int32, normaMuestreo.NOM_Anio);
            BaseDatos.AddInParameter(comando, "NOM_Descripcion", DbType.String, normaMuestreo.NOM_Descripcion);
            BaseDatos.AddInParameter(comando, "NOM_Estado", DbType.String, normaMuestreo.Estado);
            BaseDatos.AddInParameter(comando, "NOM_UsuarioCreaccion", DbType.String, normaMuestreo.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "NOM_UsuarioModificacion", DbType.String, normaMuestreo.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar NormaMuestreo.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDNormaMuestreo"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountNormaMuestreo");

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
            var comando = BaseDatos.GetStoredProcCommand("DeleteNormaMuestreo");
            BaseDatos.AddInParameter(comando, "IDNormaMuestreo", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar NormaMuestreo.");
            comando.Dispose();
            return 1;
        }

        public int Update(NormaMuestreo normaMuestreo)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateNormaMuestreo");
            BaseDatos.AddInParameter(comando, "IDNormaMuestreo", DbType.Int32, normaMuestreo.IDNormaMuestreo);
            BaseDatos.AddInParameter(comando, "NOM_Codigo", DbType.String, normaMuestreo.NOM_Codigo);
            BaseDatos.AddInParameter(comando, "NOM_Nombre", DbType.String, normaMuestreo.NOM_Nombre);
            BaseDatos.AddInParameter(comando, "NOM_Acreditador", DbType.String, normaMuestreo.NOM_Acreditador);
            BaseDatos.AddInParameter(comando, "NOM_Anio", DbType.Int32, normaMuestreo.NOM_Anio);
            BaseDatos.AddInParameter(comando, "NOM_Descripcion", DbType.String, normaMuestreo.NOM_Descripcion);
            BaseDatos.AddInParameter(comando, "NOM_Estado", DbType.String, normaMuestreo.Estado);
            BaseDatos.AddInParameter(comando, "NOM_UsuarioModificacion", DbType.String, normaMuestreo.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar NormaMuestreo.");

            comando.Dispose();
            return resultado;
        }

        public NormaMuestreo Single(int id)
        {
            var normaMuestreo = default(NormaMuestreo);
            var comando = BaseDatos.GetStoredProcCommand("SelectNormaMuestreo");

            BaseDatos.AddInParameter(comando, "IDNormaMuestreo", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    normaMuestreo = new NormaMuestreo
                    {
                        IDNormaMuestreo = lector.IsDBNull(lector.GetOrdinal("IDNormaMuestreo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDNormaMuestreo")),
                        NOM_Codigo = lector.IsDBNull(lector.GetOrdinal("NOM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Codigo")),
                        NOM_Nombre = lector.IsDBNull(lector.GetOrdinal("NOM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Nombre")),
                        NOM_Acreditador = lector.IsDBNull(lector.GetOrdinal("NOM_Acreditador")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Acreditador")),
                        NOM_Anio = lector.IsDBNull(lector.GetOrdinal("NOM_Anio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("NOM_Anio")),
                        NOM_Descripcion = lector.IsDBNull(lector.GetOrdinal("NOM_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("NOM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("NOM_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("NOM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("NOM_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("NOM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("NOM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("NOM_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return normaMuestreo;
        }

        public IList<NormaMuestreo> GetAll()
        {
            var entidades = new List<NormaMuestreo>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllNormaMuestreo");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new NormaMuestreo
                    {
                        IDNormaMuestreo = lector.IsDBNull(lector.GetOrdinal("IDNormaMuestreo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDNormaMuestreo")),
                        NOM_Codigo = lector.IsDBNull(lector.GetOrdinal("NOM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Codigo")),
                        NOM_Nombre = lector.IsDBNull(lector.GetOrdinal("NOM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Nombre")),
                        NOM_Acreditador = lector.IsDBNull(lector.GetOrdinal("NOM_Acreditador")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Acreditador")),
                        NOM_Anio = lector.IsDBNull(lector.GetOrdinal("NOM_Anio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("NOM_Anio")),
                        NOM_Descripcion = lector.IsDBNull(lector.GetOrdinal("NOM_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("NOM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("NOM_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("NOM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("NOM_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("NOM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("NOM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("NOM_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<NormaMuestreo> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<NormaMuestreo> entidades = new List<NormaMuestreo>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationNormaMuestreo");
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
                        var entidad = new NormaMuestreo();
                        entidad.IDNormaMuestreo = lector.IsDBNull(lector.GetOrdinal("IDNormaMuestreo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDNormaMuestreo"));
                        entidad.NOM_Codigo = lector.IsDBNull(lector.GetOrdinal("NOM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Codigo"));
                        entidad.NOM_Nombre = lector.IsDBNull(lector.GetOrdinal("NOM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Nombre"));
                        entidad.NOM_Acreditador = lector.IsDBNull(lector.GetOrdinal("NOM_Acreditador")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Acreditador"));
                        entidad.NOM_Anio = lector.IsDBNull(lector.GetOrdinal("NOM_Anio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("NOM_Anio"));
                        entidad.NOM_Descripcion = lector.IsDBNull(lector.GetOrdinal("NOM_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("NOM_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("NOM_Estado"));
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
