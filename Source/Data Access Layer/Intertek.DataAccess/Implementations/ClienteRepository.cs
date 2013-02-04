using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class ClienteRepository : Repository, IClienteRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public IList<Cliente> GetAll()
        {
            var entidades = new List<Cliente>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllCliente");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Cliente
                                      {
                                          IDCliente =
                                              lector.IsDBNull(lector.GetOrdinal("IDCliente"))
                                                  ? default(int)
                                                  : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                                          CLI_Codigo =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Codigo"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Codigo")),
                                          CLI_RUC =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_RUC"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_RUC")),
                                          CLI_RazonSocial =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_RazonSocial"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_RazonSocial")),
                                          CLI_Direccion =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Direccion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Direccion")),
                                          CLI_Telefono1 =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Telefono1"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Telefono1")),
                                          CLI_Correo =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Correo"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Correo")),
                                          CLI_Fax =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Fax"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Fax")),
                                          CLI_Observaciones =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Observaciones"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Observaciones")),
                                          IDDistrito =
                                              lector.IsDBNull(lector.GetOrdinal("IDDistrito"))
                                                  ? default(int)
                                                  : lector.GetInt32(lector.GetOrdinal("IDDistrito")),
                                          CLI_Telefono2 =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Telefono2"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Telefono2")),
                                          Estado =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_Estado"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_Estado")),
                                          CLI_IndicadorArea =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_IndicadorArea"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_IndicadorArea")),
                                          UsuarioCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_UsuarioCreacion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_UsuarioCreacion")),
                                          FechaHoraCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_FechaHoraCreacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CLI_FechaHoraCreacion")),
                                          UsuarioModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_UsuarioModificacion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CLI_UsuarioModificacion")),
                                          FechaHoraModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CLI_FechaHoraModificacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CLI_FechaHoraModificacion"))
                                      });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Cliente> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            IList<Cliente> entidades = new List<Cliente>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationCliente");
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
                        var entidad = new Cliente();

                        entidad.IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente"))
                                                ? default(int)
                                                : lector.GetInt32(lector.GetOrdinal("IDCliente"));
                         entidad.CLI_Codigo = lector.IsDBNull(lector.GetOrdinal("CLI_Codigo"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CLI_Codigo"));
                        entidad.CLI_RUC = lector.IsDBNull(lector.GetOrdinal("CLI_RUC"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_RUC"));
                        entidad.CLI_RazonSocial = lector.IsDBNull(lector.GetOrdinal("CLI_RazonSocial"))
                                                      ? default(string)
                                                      : lector.GetString(lector.GetOrdinal("CLI_RazonSocial"));
                        entidad.CLI_Direccion = lector.IsDBNull(lector.GetOrdinal("CLI_Direccion"))
                                                    ? default(string)
                                                    : lector.GetString(lector.GetOrdinal("CLI_Direccion"));
                        entidad.CLI_Telefono1 = lector.IsDBNull(lector.GetOrdinal("CLI_Telefono1"))
                                                    ? default(string)
                                                    : lector.GetString(lector.GetOrdinal("CLI_Telefono1"));
                        entidad.CLI_Correo = lector.IsDBNull(lector.GetOrdinal("CLI_Correo"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CLI_Correo"));
                        entidad.CLI_Fax = lector.IsDBNull(lector.GetOrdinal("CLI_Fax"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Fax"));
                        entidad.CLI_Observaciones = lector.IsDBNull(lector.GetOrdinal("CLI_Observaciones"))
                                                        ? default(string)
                                                        : lector.GetString(lector.GetOrdinal("CLI_Observaciones"));
                        entidad.IDDistrito = lector.IsDBNull(lector.GetOrdinal("IDDistrito"))
                                                 ? default(int)
                                                 : lector.GetInt32(lector.GetOrdinal("IDDistrito"));
                        entidad.CLI_Telefono2 = lector.IsDBNull(lector.GetOrdinal("CLI_Telefono2"))
                                                    ? default(string)
                                                    : lector.GetString(lector.GetOrdinal("CLI_Telefono2"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("CLI_Estado"))
                                             ? default(string)
                                             : lector.GetString(lector.GetOrdinal("CLI_Estado"));
                        entidad.CLI_IndicadorArea = lector.IsDBNull(lector.GetOrdinal("CLI_IndicadorArea"))
                                                        ? default(string)
                                                        : lector.GetString(lector.GetOrdinal("CLI_IndicadorArea"));
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

        public Cliente Single(int id)
        {
            var cliente = default(Cliente);
            var comando = BaseDatos.GetStoredProcCommand("SelectCliente");

            BaseDatos.AddInParameter(comando, "IDCliente", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    cliente = new Cliente
                                  {
                                      IDCliente =
                                          lector.IsDBNull(lector.GetOrdinal("IDCliente"))
                                              ? default(int)
                                              : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                                      CLI_Codigo =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Codigo"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Codigo")),
                                      CLI_RUC =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_RUC"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_RUC")),
                                      CLI_RazonSocial =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_RazonSocial"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_RazonSocial")),
                                      CLI_Direccion =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Direccion"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Direccion")),
                                      CLI_Telefono1 =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Telefono1"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Telefono1")),
                                      CLI_Correo =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Correo"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Correo")),
                                      CLI_Fax =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Fax"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Fax")),
                                      CLI_Observaciones =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Observaciones"))
                                              ? default(string)
                                             : lector.GetString(lector.GetOrdinal("CLI_Observaciones")),
                                    
                                         IDPais =
                                       lector.IsDBNull(lector.GetOrdinal("IDPais"))
                                       ? default(int)
                                      : lector.GetInt32(lector.GetOrdinal("IDPais")),
                                      IDDepartamento =
                                      lector.IsDBNull(lector.GetOrdinal("IDDepartamento"))
                                      ? default(int)
                                     : lector.GetInt32(lector.GetOrdinal("IDDepartamento")),
                                      IDProvincia =
                                      lector.IsDBNull(lector.GetOrdinal("IDProvincia"))
                                      ? default(int)
                                     : lector.GetInt32(lector.GetOrdinal("IDProvincia")),
                                      IDDistrito =
                                         lector.IsDBNull(lector.GetOrdinal("IDDistrito"))
                                             ? default(int)
                                             : lector.GetInt32(lector.GetOrdinal("IDDistrito")),

                                      CLI_Telefono2 =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Telefono2"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Telefono2")),
                                      Estado =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_Estado"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_Estado")),
                                      CLI_IndicadorArea =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_IndicadorArea"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_IndicadorArea")),

                                      CLI_AnexoOficina =
                                    lector.IsDBNull(lector.GetOrdinal("CLI_AnexoOficina"))
                                     ? default(string)
                                     : lector.GetString(lector.GetOrdinal("CLI_AnexoOficina")),
                                      ClI_AnexoPlanta =
                                  lector.IsDBNull(lector.GetOrdinal("ClI_AnexoPlanta"))
                                   ? default(string)
                                   : lector.GetString(lector.GetOrdinal("ClI_AnexoPlanta")),

                                      UsuarioCreacion =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_UsuarioCreacion"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_UsuarioCreacion")),
                                      FechaHoraCreacion =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_FechaHoraCreacion"))
                                              ? default(DateTime)
                                              : lector.GetDateTime(lector.GetOrdinal("CLI_FechaHoraCreacion")),
                                      UsuarioModificacion =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_UsuarioModificacion"))
                                              ? default(string)
                                              : lector.GetString(lector.GetOrdinal("CLI_UsuarioModificacion")),
                                      FechaHoraModificacion =
                                          lector.IsDBNull(lector.GetOrdinal("CLI_FechaHoraModificacion"))
                                              ? default(DateTime)
                                              : lector.GetDateTime(lector.GetOrdinal("CLI_FechaHoraModificacion"))
                                  };
                }
            }
            comando.Dispose();
            return cliente;
        }

        public int Count(string where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountCliente");

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

        public int Add(Cliente cliente)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertCliente");
            BaseDatos.AddOutParameter(comando, "IDCliente", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "CLI_Codigo", DbType.String, cliente.CLI_Codigo);
            BaseDatos.AddInParameter(comando, "CLI_RUC", DbType.String, cliente.CLI_RUC);
            BaseDatos.AddInParameter(comando, "CLI_RazonSocial", DbType.String, cliente.CLI_RazonSocial);
            BaseDatos.AddInParameter(comando, "CLI_Direccion", DbType.String, cliente.CLI_Direccion);
            BaseDatos.AddInParameter(comando, "CLI_Telefono1", DbType.String, cliente.CLI_Telefono1);
            BaseDatos.AddInParameter(comando, "CLI_Correo", DbType.String, cliente.CLI_Correo);
            BaseDatos.AddInParameter(comando, "CLI_Fax", DbType.String, cliente.CLI_Fax);
            BaseDatos.AddInParameter(comando, "CLI_Observaciones", DbType.String, cliente.CLI_Observaciones);
            BaseDatos.AddInParameter(comando, "IDDistrito", DbType.String, (cliente.Distrito.IDDistrito == 0 ? DBNull.Value as object : Convert.ToInt32(cliente.Distrito.IDDistrito)));
            BaseDatos.AddInParameter(comando, "CLI_Telefono2", DbType.String, cliente.CLI_Telefono2);
            BaseDatos.AddInParameter(comando, "CLI_Estado", DbType.String, cliente.Estado);
            BaseDatos.AddInParameter(comando, "CLI_IndicadorArea", DbType.String, cliente.CLI_IndicadorArea);
            BaseDatos.AddInParameter(comando, "CLI_AnexoOficina", DbType.String,(cliente.CLI_AnexoOficina=="0"? DBNull.Value as object: cliente.CLI_AnexoOficina));
            BaseDatos.AddInParameter(comando, "ClI_AnexoPlanta", DbType.String, (cliente.ClI_AnexoPlanta=="0" ? DBNull.Value as object : cliente.ClI_AnexoPlanta));

            BaseDatos.AddInParameter(comando, "CLI_UsuarioCreacion", DbType.String, cliente.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "CLI_UsuarioModificacion", DbType.String, cliente.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
           // if (resultado == 0) throw new Exception("Error al Agregar Cliente.");

            var valorDevuelto = (int) BaseDatos.GetParameterValue(comando, "IDCliente");
        
            comando.Dispose();
            return valorDevuelto;
        }

        public int Update(Cliente cliente)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateCliente");
            BaseDatos.AddInParameter(comando, "IDCliente", DbType.Int32, cliente.IDCliente);
            BaseDatos.AddInParameter(comando, "CLI_Codigo", DbType.String, cliente.CLI_Codigo);
            BaseDatos.AddInParameter(comando, "CLI_RUC", DbType.String, cliente.CLI_RUC);
            BaseDatos.AddInParameter(comando, "CLI_RazonSocial", DbType.String, cliente.CLI_RazonSocial);
            BaseDatos.AddInParameter(comando, "CLI_Direccion", DbType.String, cliente.CLI_Direccion);
            BaseDatos.AddInParameter(comando, "CLI_Telefono1", DbType.String, cliente.CLI_Telefono1);
            BaseDatos.AddInParameter(comando, "CLI_Correo", DbType.String, cliente.CLI_Correo);
            BaseDatos.AddInParameter(comando, "CLI_Fax", DbType.String, cliente.CLI_Fax);
            BaseDatos.AddInParameter(comando, "CLI_Observaciones", DbType.String, cliente.CLI_Observaciones);
            BaseDatos.AddInParameter(comando, "IDDistrito", DbType.Int32, (cliente.Distrito.IDDistrito == null ? DBNull.Value as object : Convert.ToInt32(cliente.Distrito.IDDistrito)));
            BaseDatos.AddInParameter(comando, "CLI_Telefono2", DbType.String, cliente.CLI_Telefono2);
            BaseDatos.AddInParameter(comando, "CLI_Estado", DbType.String, cliente.Estado);
            BaseDatos.AddInParameter(comando, "CLI_IndicadorArea", DbType.String, cliente.CLI_IndicadorArea);
            BaseDatos.AddInParameter(comando, "CLI_AnexoOficina", DbType.String , (cliente.CLI_AnexoOficina == null ? DBNull.Value as object : cliente.CLI_AnexoOficina));
            BaseDatos.AddInParameter(comando, "ClI_AnexoPlanta", DbType.String, (cliente.ClI_AnexoPlanta == null ? DBNull.Value as object : cliente.ClI_AnexoPlanta));
            BaseDatos.AddInParameter(comando, "CLI_UsuarioModificacion", DbType.String, cliente.UsuarioModificacion);
            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Cliente.");

            comando.Dispose();
            return resultado;
        }

        public int Delete(int id)
        {
            var comando = BaseDatos.GetStoredProcCommand("DeleteCliente");
            BaseDatos.AddInParameter(comando, "IDCliente", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Cliente.");
            comando.Dispose();
            return 1;
        }

        #endregion Metodos Publicos

        #endregion Métodos
    }
}
