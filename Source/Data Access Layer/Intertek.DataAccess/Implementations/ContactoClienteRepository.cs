using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
    public class ContactoClienteRepository : Repository, IContactoClienteRepository
    {
       public IList<ContactoCliente> ListarPorIDCliente(int iDCliente)
       {
           var entidades = new List<ContactoCliente>();
           var comando = BaseDatos.GetStoredProcCommand("SelectContactoClienteByIDCliente");

           BaseDatos.AddInParameter(comando, "IDCliente", DbType.Int32, iDCliente);

           using (var lector = BaseDatos.ExecuteReader(comando))
           {
               while (lector.Read())
               {
                   entidades.Add(new ContactoCliente
                   {
                       Id = lector.IsDBNull(lector.GetOrdinal("IDContactoCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDContactoCliente")),
                       COC_Codigo = lector.IsDBNull(lector.GetOrdinal("COC_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Codigo")),
                       COC_Nombres = lector.IsDBNull(lector.GetOrdinal("COC_Nombres")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Nombres")),
                       COC_Apellidos = lector.IsDBNull(lector.GetOrdinal("COC_Apellidos")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Apellidos")),
                       COC_Cargo = lector.IsDBNull(lector.GetOrdinal("COC_Cargo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Cargo")),
                       COC_Telefono1 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono1")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono1")),
                       COC_Telefono2 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono2")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono2")),
                       IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                       Estado = lector.IsDBNull(lector.GetOrdinal("COC_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Estado")),
                       UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioCreacion")),
                       FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraCreacion")),
                       UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioModificacion")),
                       FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraModificacion"))
                   });
               }
           }
           comando.Dispose();
           return entidades;
       }

       public int Add(ContactoCliente cliente)
       {
           var comando = BaseDatos.GetStoredProcCommand("InsertContactoCliente");
           BaseDatos.AddOutParameter(comando, "IDContactoCliente", DbType.Int32, 10);
           BaseDatos.AddInParameter(comando, "COC_Codigo", DbType.String, cliente.COC_Codigo);
           BaseDatos.AddInParameter(comando, "COC_Nombres", DbType.String, cliente.COC_Nombres);
           BaseDatos.AddInParameter(comando, "COC_Apellidos", DbType.String, cliente.COC_Apellidos);
           BaseDatos.AddInParameter(comando, "COC_Cargo", DbType.String, cliente.COC_Cargo);
           BaseDatos.AddInParameter(comando, "COC_Telefono1", DbType.String, cliente.COC_Telefono1);
           BaseDatos.AddInParameter(comando, "COC_Telefono2", DbType.String, cliente.COC_Telefono2);
           BaseDatos.AddInParameter(comando, "IDCliente", DbType.String, cliente.IDCliente);
           BaseDatos.AddInParameter(comando, "COC_Estado", DbType.String, cliente.Estado);
           BaseDatos.AddInParameter(comando, "COC_UsuarioCreacion", DbType.String, cliente.UsuarioCreacion);
           BaseDatos.AddInParameter(comando, "COC_UsuarioModificacion", DbType.String, cliente.UsuarioModificacion);
           var resultado = BaseDatos.ExecuteNonQuery(comando);
           // if (resultado == 0) throw new Exception("Error al Agregar Cliente.");
           var valorDevuelto = (int)BaseDatos.GetParameterValue(comando, "IDContactoCliente");
           comando.Dispose();
           return valorDevuelto;

       }

       public IList<ContactoCliente> GetAll()
       {
           throw new NotImplementedException();
       }

       public IList<ContactoCliente> GetAll(string sidx, string sord, int rows, int page, string where)
       {
           IList<ContactoCliente> entidades = new List<ContactoCliente>();

           var comando = BaseDatos.GetStoredProcCommand("SelectPaginationContactoCliente");
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
                       var entidad = new ContactoCliente();

                       entidad.IDContactoCliente = lector.IsDBNull(lector.GetOrdinal("IDContactoCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDContactoCliente"));
                       entidad.COC_Codigo = lector.IsDBNull(lector.GetOrdinal("COC_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Codigo"));
                       entidad.COC_Nombres = lector.IsDBNull(lector.GetOrdinal("COC_Nombres")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Nombres"));
                       entidad. COC_Apellidos = lector.IsDBNull(lector.GetOrdinal("COC_Apellidos")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Apellidos"));
                       entidad. COC_Cargo = lector.IsDBNull(lector.GetOrdinal("COC_Cargo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Cargo"));
                       entidad .COC_Telefono1 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono1")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono1"));
                       entidad .COC_Telefono2 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono2")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono2"));
                       entidad. IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente"));
                       entidad.Estado = lector.IsDBNull(lector.GetOrdinal("COC_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Estado"));
                       entidad .UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioCreacion"));
                       entidad.FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraCreacion"));
                       entidad.UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioModificacion"));
                       entidad. FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraModificacion"));
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



       public List<ContactoCliente> Search(int idCiente)
       {
           List<ContactoCliente> entidades = new List<ContactoCliente>();

           var comando = BaseDatos.GetStoredProcCommand("SelectContactoCliente");
           BaseDatos.AddInParameter(comando, "IDCliente", DbType.Int32, idCiente);
           try
           {
               using (var lector = BaseDatos.ExecuteReader(comando))
               {
                   while (lector.Read())
                   {
                       var entidad = new ContactoCliente();

                       entidad.IDContactoCliente = lector.IsDBNull(lector.GetOrdinal("IDContactoCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDContactoCliente"));
                       entidad.COC_Codigo = lector.IsDBNull(lector.GetOrdinal("COC_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Codigo"));
                       entidad.COC_Nombres = lector.IsDBNull(lector.GetOrdinal("COC_Nombres")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Nombres"));
                       entidad.COC_Apellidos = lector.IsDBNull(lector.GetOrdinal("COC_Apellidos")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Apellidos"));
                       entidad.COC_Cargo = lector.IsDBNull(lector.GetOrdinal("COC_Cargo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Cargo"));
                       entidad.COC_Telefono1 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono1")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono1"));
                       entidad.COC_Telefono2 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono2")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono2"));
                       entidad.IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente"));
                       entidad.Estado = lector.IsDBNull(lector.GetOrdinal("COC_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Estado"));
                       entidad.UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioCreacion"));
                       entidad.FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraCreacion"));
                       entidad.UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioModificacion"));
                       entidad.FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraModificacion"));
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


       public ContactoCliente Single(int id)
       {
           var cliente = default(ContactoCliente);
           var comando = BaseDatos.GetStoredProcCommand("SelectContactoCliente");

           BaseDatos.AddInParameter(comando, "IDContactoCliente", DbType.Int32, id);

           using (var lector = BaseDatos.ExecuteReader(comando))
           {
               while (lector.Read())
               {
                   cliente = new ContactoCliente
                   {
                       Id = lector.IsDBNull(lector.GetOrdinal("IDContactoCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDContactoCliente")),
                       COC_Codigo = lector.IsDBNull(lector.GetOrdinal("COC_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Codigo")),
                       COC_Nombres = lector.IsDBNull(lector.GetOrdinal("COC_Nombres")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Nombres")),
                       COC_Apellidos = lector.IsDBNull(lector.GetOrdinal("COC_Apellidos")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Apellidos")),
                       COC_Cargo = lector.IsDBNull(lector.GetOrdinal("COC_Cargo")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Cargo")),
                       COC_Telefono1 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono1")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono1")),
                       COC_Telefono2 = lector.IsDBNull(lector.GetOrdinal("COC_Telefono2")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Telefono2")),
                       IDCliente = lector.IsDBNull(lector.GetOrdinal("IDCliente")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCliente")),
                       Estado = lector.IsDBNull(lector.GetOrdinal("COC_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_Estado")),
                       UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioCreacion")),
                       FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraCreacion")),
                       UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("COC_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("COC_UsuarioModificacion")),
                       FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("COC_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("COC_FechaHoraModificacion"))

                   };
               }
           }
           comando.Dispose();
           return cliente;
       }

       public int Count(string where = "")
       {
           int cantidad = 0;
           var comando = BaseDatos.GetStoredProcCommand("CountContactoCliente");

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

  

       public int Update(ContactoCliente cliente)
       {
           var comando = BaseDatos.GetStoredProcCommand("UpdateContactoCliente");
           BaseDatos.AddInParameter(comando, "IDContactoCliente", DbType.Int32, cliente.IDContactoCliente);
           BaseDatos.AddInParameter(comando, "COC_Codigo", DbType.String, cliente.COC_Codigo);
           BaseDatos.AddInParameter(comando, "COC_Nombres", DbType.String, cliente.COC_Nombres);
           BaseDatos.AddInParameter(comando, "COC_Apellidos", DbType.String, cliente.COC_Apellidos);
           BaseDatos.AddInParameter(comando, "COC_Cargo", DbType.String, cliente.COC_Cargo);
           BaseDatos.AddInParameter(comando, "COC_Telefono1", DbType.String, cliente.COC_Telefono1);
           BaseDatos.AddInParameter(comando, "COC_Telefono2", DbType.String, cliente.COC_Telefono2);
           BaseDatos.AddInParameter(comando, "IDCliente", DbType.String, cliente.IDCliente);
           BaseDatos.AddInParameter(comando, "COC_Estado", DbType.String, cliente.Estado);
          // BaseDatos.AddInParameter(comando, "COC_UsuarioCreacion", DbType.String, cliente.UsuarioCreacion);
           BaseDatos.AddInParameter(comando, "COC_UsuarioModificacion", DbType.String, cliente.UsuarioModificacion);
           var resultado = BaseDatos.ExecuteNonQuery(comando);
           if (resultado == 0) throw new Exception("Error al Modificar contacto de Contacto Cliente.");

           comando.Dispose();
           return resultado;
       }

       public int Delete(int id)
       {
           var comando = BaseDatos.GetStoredProcCommand("DeleteContactoCliente");
           BaseDatos.AddInParameter(comando, "IDContactoCliente", DbType.Int32, id);

           var resultado = BaseDatos.ExecuteNonQuery(comando);
           if (resultado == 0) throw new Exception("Error al Eliminar Contacto Cliente.");
           comando.Dispose();
           return 1;
       }
    }
}
