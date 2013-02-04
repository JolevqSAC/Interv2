using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
    public class DireccionClienteRepository : Repository, IDirecionClienteRepository
    {

        public IList<DireccionCliente> ListarPorIDCliente(int iDCliente)
        {
            var entidades = new List<DireccionCliente>();
            var comando = BaseDatos.GetStoredProcCommand("SelectDireccionClienteByIDCliente");

            BaseDatos.AddInParameter(comando, "IDCliente", DbType.Int32, iDCliente);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new DireccionCliente
                    {
                        IDDireccionCliente = lector.IsDBNull(lector.GetOrdinal("IDDireccionCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDDireccionCliente")),
                        DIC_Codigo = lector.IsDBNull(lector.GetOrdinal("DIC_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("DIC_Codigo")),
                        DIC_Tipo = lector.IsDBNull(lector.GetOrdinal("DIC_Tipo")) ? default(string) : lector.GetString(lector.GetOrdinal("DIC_Tipo")),
                        DIC_Descripcion = lector.IsDBNull(lector.GetOrdinal("DIC_Descripcion")) ? default(string) : lector.GetString(lector.GetOrdinal("DIC_Descripcion")),
                        IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("DIC_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("DIC_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("DIC_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("DIC_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("DIC_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("DIC_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("DIC_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("DIC_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("DIC_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("DIC_FechaHoraModificacion"))
                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public int Update(DireccionCliente entity)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertDireccionCliente");
            BaseDatos.AddOutParameter(comando, "IDDireccionCliente", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "DIC_Codigo", DbType.String, entity.DIC_Codigo);
            BaseDatos.AddInParameter(comando, "DIC_Tipo", DbType.String, entity.DIC_Tipo);
            BaseDatos.AddInParameter(comando, "DIC_Descripcion", DbType.String, entity.DIC_Descripcion);
            BaseDatos.AddInParameter(comando, "DIC_Estado", DbType.String, entity.Estado);
            BaseDatos.AddInParameter(comando, "DIC_UsuarioModificacion", DbType.String, entity.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "DIC_UsuarioModificacion", DbType.String, entity.UsuarioModificacion);
            var resultado = BaseDatos.ExecuteNonQuery(comando);
            // if (resultado == 0) throw new Exception("Error al Agregar Cliente.");
            var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDCliente");
            comando.Dispose();
            return valorDevuelto;
        }
        public IList<Business.Entity.DireccionCliente> GetAll()
        {
            throw new NotImplementedException();
        }

        public IList<Business.Entity.DireccionCliente> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Business.Entity.DireccionCliente Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountDireccionCliente");
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

        public int Add(DireccionCliente entity)
        {
            throw new NotImplementedException();
        }

       

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
