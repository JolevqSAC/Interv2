using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
   public class ContratoRepository:Repository,IContratoRepository
    {

        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public int Add(Contrato contrato)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertContrato");
            BaseDatos.AddOutParameter(comando, "IDContrato", DbType.Int32, 4);
            BaseDatos.AddInParameter(comando, "CON_Codigo", DbType.String, contrato.CON_Codigo);
            BaseDatos.AddInParameter(comando, "CON_Descripcion", DbType.String, contrato.CON_Descripcion);
            BaseDatos.AddInParameter(comando, "CON_FechaInico", DbType.DateTime, contrato.CON_FechaInico);
            BaseDatos.AddInParameter(comando, "CON_FechaFin", DbType.DateTime, contrato.CON_FechaFin);
            BaseDatos.AddInParameter(comando, "CON_EstadoContrato", DbType.String, contrato.CON_EstadoContrato);
            BaseDatos.AddInParameter(comando, "IDCliente", DbType.String, contrato.IDCliente);
            BaseDatos.AddInParameter(comando, "CON_Estado", DbType.String, contrato.Estado);
            BaseDatos.AddInParameter(comando, "CON_UsuarioCreaccion", DbType.String, contrato.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "CON_UsuarioModificacion", DbType.String, contrato.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Contrato.");

            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDContrato"); ;
            comando.Dispose();
            return valorDevuelto;
        }

        public int Count(string @where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountContrato");

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
            var comando = BaseDatos.GetStoredProcCommand("DeleteContrato");
            BaseDatos.AddInParameter(comando, "IDContrato", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Contrato.");
            comando.Dispose();
            return 1;
        }

        public int Update(Contrato contrato)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateContrato");
            BaseDatos.AddInParameter(comando, "IDContrato", DbType.Int32, contrato.IDContrato);
            BaseDatos.AddInParameter(comando, "CON_Codigo", DbType.String, contrato.CON_Codigo);
            BaseDatos.AddInParameter(comando, "CON_Descripcion", DbType.String, contrato.CON_Descripcion);
            BaseDatos.AddInParameter(comando, "CON_FechaInico", DbType.DateTime, contrato.CON_FechaInico);
            BaseDatos.AddInParameter(comando, "CON_FechaFin", DbType.DateTime, contrato.CON_FechaFin);
            BaseDatos.AddInParameter(comando, "CON_EstadoContrato", DbType.String, contrato.CON_EstadoContrato);
            BaseDatos.AddInParameter(comando, "IDCliente", DbType.String, contrato.IDCliente);
            BaseDatos.AddInParameter(comando, "CON_Estado", DbType.String, contrato.Estado);
            BaseDatos.AddInParameter(comando, "CON_UsuarioModificacion", DbType.String, contrato.UsuarioModificacion);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Contrato.");

            comando.Dispose();
            return resultado;
        }

        public Contrato Single(int id)
        {
            var contrato = default(Contrato);
            var comando = BaseDatos.GetStoredProcCommand("SelectContrato");

            BaseDatos.AddInParameter(comando, "IDContrato", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    contrato = new Contrato
                    {
                        IDContrato = lector.IsDBNull(lector.GetOrdinal("IDContrato")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDContrato")),
                        CON_Codigo = lector.IsDBNull(lector.GetOrdinal("CON_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Codigo")),
                        CON_Descripcion = lector.IsDBNull(lector.GetOrdinal("CON_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Descripcion")),

                        CON_FechaInico = lector.IsDBNull(lector.GetOrdinal("CON_FechaInico")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaInico")),
                        CON_FechaFin = lector.IsDBNull(lector.GetOrdinal("CON_FechaFin")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaFin")),
                        CON_EstadoContrato = lector.IsDBNull(lector.GetOrdinal("CON_EstadoContrato")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_EstadoContrato")),
                        IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                        NombreCliente = lector.IsDBNull(lector.GetOrdinal("NombreCliente")) ? default(string) : lector.GetString(lector.GetOrdinal("NombreCliente")),

                        Estado = lector.IsDBNull(lector.GetOrdinal("CON_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("CON_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("CON_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("CON_UsuaroModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_UsuaroModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("CON_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaHoraModificacion"))
                    };
                }
            }
            comando.Dispose();
            return contrato;
        }

        public IList<Contrato> GetAll()
        {
            var entidades = new List<Contrato>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllContrato");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Contrato
                    {
                        IDContrato = lector.IsDBNull(lector.GetOrdinal("IDContrato")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDContrato")),
                        CON_Codigo = lector.IsDBNull(lector.GetOrdinal("CON_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Codigo")),
                        CON_Descripcion = lector.IsDBNull(lector.GetOrdinal("CON_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Descripcion")),

                        CON_FechaInico = lector.IsDBNull(lector.GetOrdinal("CON_FechaInico")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaInico")),
                        CON_FechaFin = lector.IsDBNull(lector.GetOrdinal("CON_FechaFin")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaFin")),
                        CON_EstadoContrato = lector.IsDBNull(lector.GetOrdinal("CON_EstadoContrato")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_EstadoContrato")),
                        IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                        NombreCliente = lector.IsDBNull(lector.GetOrdinal("NombreCliente")) ? default(string) : lector.GetString(lector.GetOrdinal("NombreCliente")),
                        
                        Estado = lector.IsDBNull(lector.GetOrdinal("CON_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("CON_UsuarioCreaccion")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_UsuarioCreaccion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("CON_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("CON_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("CON_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Contrato> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Contrato> entidades = new List<Contrato>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationContrato");
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
                        var entidad = new Contrato();
                        entidad.IDContrato = lector.IsDBNull(lector.GetOrdinal("IDContrato")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDContrato"));
                        entidad.CON_Codigo = lector.IsDBNull(lector.GetOrdinal("CON_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Codigo"));                       
                        entidad.CON_Descripcion = lector.IsDBNull(lector.GetOrdinal("CON_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Descripcion"));
                        
                        entidad.CON_FechaInico = lector.IsDBNull(lector.GetOrdinal("CON_FechaInico")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaInico"));
                        entidad.CON_FechaFin = lector.IsDBNull(lector.GetOrdinal("CON_FechaFin")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CON_FechaFin"));
                        entidad.CON_EstadoContrato = lector.IsDBNull(lector.GetOrdinal("CON_EstadoContrato")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_EstadoContrato"));
                        entidad.IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente"));
                        entidad.NombreCliente = lector.IsDBNull(lector.GetOrdinal("NombreCliente")) ? default(string) : lector.GetString(lector.GetOrdinal("NombreCliente"));
                        
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("CON_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("CON_Estado"));
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

        public IList<Cliente> Search(string nombre)
        {
            var entidades = new List<Cliente>();
            var comando = BaseDatos.GetStoredProcCommand("SelectClientesContrato");
            BaseDatos.AddInParameter(comando, "nombre", DbType.String, nombre);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Cliente
                    {
                        IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                        CLI_Codigo = lector.IsDBNull(lector.GetOrdinal("CLI_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("CLI_Codigo")),
                        CLI_RazonSocial = lector.IsDBNull(lector.GetOrdinal("CLI_RazonSocial")) ? default(string) : lector.GetString(lector.GetOrdinal("CLI_RazonSocial")),
                        CLI_Observaciones = lector.IsDBNull(lector.GetOrdinal("CLI_Observaciones")) ? default(string) : lector.GetString(lector.GetOrdinal("CLI_Observaciones")),

                        Estado = lector.IsDBNull(lector.GetOrdinal("CLI_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("CLI_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("CLI_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("CLI_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("CLI_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CLI_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("CLI_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("CLI_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("CLI_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("CLI_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public string SearchNombre(int idCliente) 
        {
            var comando = BaseDatos.GetStoredProcCommand("SelectNombreClientesContrato");
            BaseDatos.AddInParameter(comando, "idCliente", DbType.Int32, idCliente);
            var NombreCliente = "";
            try
            {
                NombreCliente = BaseDatos.ExecuteScalar(comando).ToString();
            }
            catch (Exception)
            {
                NombreCliente = "";
            }
            
            comando.Dispose();
            return NombreCliente;
        }

        #endregion Metodos Publicos

        #endregion Métodos


   
   }
}
