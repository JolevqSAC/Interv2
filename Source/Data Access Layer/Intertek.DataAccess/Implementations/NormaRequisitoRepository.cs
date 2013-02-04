using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
    public class NormaRequisitoRepository : Repository, INormaRequisitoRepository
    {
        #region Metodos Publicos
        public int Add(NormaRequisito unidad)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertNormaRequisito");
            BaseDatos.AddOutParameter(comando, "IDNormaRequisito", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "NRE_Codigo", DbType.String, unidad.NRE_Codigo);

            BaseDatos.AddInParameter(comando, "NRE_Nombre", DbType.String, unidad.NRE_Nombre);
            BaseDatos.AddInParameter(comando, "NRE_Anio", DbType.String, unidad.NRE_Anio);
            BaseDatos.AddInParameter(comando, "NRE_Acreditador", DbType.String, unidad.NRE_Acreditador);

            BaseDatos.AddInParameter(comando, "NRE_Descripcion", DbType.String, unidad.NRE_Descripcion);
            BaseDatos.AddInParameter(comando, "NRE_Estado", DbType.String, unidad.Estado);
            BaseDatos.AddInParameter(comando, "NRE_UsuarioCreacion", DbType.String, unidad.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "NRE_UsuarioModificacion", DbType.String, unidad.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Norma Requisito.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDNormaRequisito"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Delete(int id)
        {
            var comando = BaseDatos.GetStoredProcCommand("DeleteNormaRequisito");
            BaseDatos.AddInParameter(comando, "IDNormaRequisito", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Norma Requisito.");
            comando.Dispose();
            return 1;
        }
        public int Update(NormaRequisito unidad)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateNormaRequisito");
            BaseDatos.AddInParameter(comando, "IDNormaRequisito", DbType.Int32, unidad.IDNormaRequisito);
            BaseDatos.AddInParameter(comando, "NRE_Codigo", DbType.String, unidad.NRE_Codigo);

            BaseDatos.AddInParameter(comando, "NRE_Nombre", DbType.String, unidad.NRE_Nombre);
            BaseDatos.AddInParameter(comando, "NRE_Anio", DbType.String, unidad.NRE_Anio);
            BaseDatos.AddInParameter(comando, "NRE_Acreditador", DbType.String, unidad.NRE_Acreditador);

            BaseDatos.AddInParameter(comando, "NRE_Descripcion", DbType.String, unidad.NRE_Descripcion);
            BaseDatos.AddInParameter(comando, "NRE_Estado", DbType.String, unidad.Estado);
          //  BaseDatos.AddInParameter(comando, "NRE_UsuarioCreaccion", DbType.String, unidad.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "NRE_UsuarioModificacion", DbType.String, unidad.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
           
            if (resultado == 0) throw new Exception("Error al Modificar Norma Requesito.");

            comando.Dispose();
            return resultado;
        }

        public NormaRequisito Single(int id)
        {
            var unidad = default(NormaRequisito);
            var comando = BaseDatos.GetStoredProcCommand("SelectNormaRequisito");
            BaseDatos.AddInParameter(comando, "IDNormaRequisito", DbType.Int32, id);
            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    unidad = new NormaRequisito
                    {
                        IDNormaRequisito = lector.IsDBNull(lector.GetOrdinal("IDNormaRequisito")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDNormaRequisito")),
                        NRE_Codigo = lector.IsDBNull(lector.GetOrdinal("NRE_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Codigo")),
                        NRE_Nombre = lector.IsDBNull(lector.GetOrdinal("NRE_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Nombre")),
                        NRE_Anio = lector.IsDBNull(lector.GetOrdinal("NRE_Anio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("NRE_Anio")),
                        NRE_Acreditador = lector.IsDBNull(lector.GetOrdinal("NRE_Acreditador")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Acreditador")),
                        NRE_Descripcion = lector.IsDBNull(lector.GetOrdinal("NRE_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Descripcion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("NRE_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Estado")),
                      //  UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioCreacion")),
                      //  FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraCreacion")),
                       // UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioModificacion")),
                       // FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return unidad;
        }

        public IList<NormaRequisito> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<NormaRequisito> entidades = new List<NormaRequisito>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationNormaRequisito");
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
                        var entidad = new NormaRequisito();
                        entidad.IDNormaRequisito = lector.IsDBNull(lector.GetOrdinal("IDNormaRequisito")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDNormaRequisito"));
                       entidad. NRE_Codigo = lector.IsDBNull(lector.GetOrdinal("NRE_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Codigo"));
                        entidad.NRE_Nombre = lector.IsDBNull(lector.GetOrdinal("NRE_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Nombre"));
                       entidad. NRE_Anio = lector.IsDBNull(lector.GetOrdinal("NRE_Anio")) ? default(int) : lector.GetInt32(lector.GetOrdinal("NRE_Anio"));
                       entidad. NRE_Acreditador = lector.IsDBNull(lector.GetOrdinal("NRE_Acreditador")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Acreditador"));
                        entidad.NRE_Descripcion = lector.IsDBNull(lector.GetOrdinal("NRE_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Descripcion"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("NRE_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("NRE_Estado"));
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

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountNormaRequisito");

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

        public IList<UnidadMedida> GetAll()
        {
            var entidades = new List<UnidadMedida>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllNormaRequisito");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new UnidadMedida
                    {
                        IDUnidadMedida = lector.IsDBNull(lector.GetOrdinal("IDUnidadMedida")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDUnidadMedida")),
                        UNM_Codigo = lector.IsDBNull(lector.GetOrdinal("UNM_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Codigo")),
                        UNM_Nombre = lector.IsDBNull(lector.GetOrdinal("UNM_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Nombre")),
                        UNM_NombreCorto = lector.IsDBNull(lector.GetOrdinal("UNM_NombreCorto")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_NombreCorto")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("NRE_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("UNM_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("UNM_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("UNM_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }


        #endregion


        IList<NormaRequisito> Business.Entity.Repository.IRepository<NormaRequisito>.GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
