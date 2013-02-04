using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
    public class OpcionSistemaRepository : Repository, IOpcionSistemaRepository
    {

        public   IList<OpcionSistema> GetOpcionSistemaPorModulo( int idOpcionSistema )
        {
            IList<OpcionSistema> entidades = new List<OpcionSistema>();

            var comando = BaseDatos.GetStoredProcCommand("GetOpcionSistemaPorModulo");

            BaseDatos.AddInParameter(comando, "IDOpcionSistema", DbType.Int32, idOpcionSistema);
         //   BaseDatos.AddInParameter(comando, "OSI_Modulo_en_US", DbType.String, moduloUS);
            try
            {
                using (var lector = BaseDatos.ExecuteReader(comando))
                {
                    while (lector.Read())
                    {
                        var entidad = new OpcionSistema();
                        entidad.IDOpcionSistema = lector.IsDBNull(lector.GetOrdinal("IDOpcionSistema")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDOpcionSistema"));
                        entidad.OSI_Nombre = lector.IsDBNull(lector.GetOrdinal("OSI_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_Nombre"));
                        entidad.OSI_Modulo = lector.IsDBNull(lector.GetOrdinal("OSI_Modulo")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_Modulo"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("OSI_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_Estado"));
                        entidad.OSI_Modulo_en_US = lector.IsDBNull(lector.GetOrdinal("OSI_Modulo_en_US")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_Modulo_en_US"));
                        entidad.OSI_Nombre_en_US = lector.IsDBNull(lector.GetOrdinal("OSI_Nombre_en_US")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_Nombre_en_US"));
                        entidad.OSI_RutaPagina = lector.IsDBNull(lector.GetOrdinal("OSI_RutaPagina")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_RutaPagina"));                                    
                        entidad.UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("OSI_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_UsuarioCreacion"));
                        entidad.FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("OSI_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("OSI_FechaHoraCreacion"));
                        entidad.UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("OSI_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_UsuarioModificacion"));
                        entidad.FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("OSI_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("OSI_FechaHoraModificacion"));
                        entidad.OSI_Codigo = lector.IsDBNull(lector.GetOrdinal("OSI_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("OSI_Codigo"));
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

        public IList<Business.Entity.OpcionSistema> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Business.Entity.OpcionSistema Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Business.Entity.OpcionSistema entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Business.Entity.OpcionSistema entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IList<OpcionSistema> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
