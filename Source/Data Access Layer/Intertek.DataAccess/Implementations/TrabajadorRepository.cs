using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using System.Data;
using Intertek.Business.Entity;

namespace Intertek.DataAccess.Implementations
{
    public class TrabajadorRepository : Repository, ITrabajadorRepository
    {
        public IList<Trabajador> GetAll()
        {
            var entidades = new List<Trabajador>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllTrabajador");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Trabajador
                    {
                        IDPersonal = lector.IsDBNull(lector.GetOrdinal("IDPersonal")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDPersonal")),
                        
                        IDCargo = lector.IsDBNull(lector.GetOrdinal("IDCargo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCargo")),                      
                        //Cargo = new Cargo(),
                        //Cargo.CAR_Nombre = lector.IsDBNull(lector.GetOrdinal("CAR_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("CAR_Nombre")),

                        IDDistrito = lector.IsDBNull(lector.GetOrdinal("IDDistrito")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDDistrito")),
                        //Distrito = new Distrito(),
                        //Distrito.DIS_Nombre = lector.IsDBNull(lector.GetOrdinal("DIS_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("DIS_Nombre")),                      
                        
                        PER_Codigo = lector.IsDBNull(lector.GetOrdinal("PER_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Codigo")),
                        PER_Nombres = lector.IsDBNull(lector.GetOrdinal("PER_Nombres")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Nombres")),
                        PER_Apellidos = lector.IsDBNull(lector.GetOrdinal("PER_Apellidos")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Apellidos")),
                        PER_DNI = lector.IsDBNull(lector.GetOrdinal("PER_DNI")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_DNI")),
                        PER_Direccion = lector.IsDBNull(lector.GetOrdinal("PER_Direccion")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Direccion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("PER_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Estado")),
                        UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("PER_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_UsuarioCreacion")),
                        FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("PER_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PER_FechaHoraCreacion")),
                        UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("PER_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_UsuarioModificacion")),
                        FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("PER_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PER_FechaHoraModificacion"))

                    });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Trabajador> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            IList<Trabajador> entidades = new List<Trabajador>();
            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationTrabajador");
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
                        var entidad = new Trabajador();
                        entidad.IDPersonal = lector.IsDBNull(lector.GetOrdinal("IDPersonal")) ? default(int) :lector.GetInt32( lector.GetOrdinal("IDPersonal"));
                        
                        entidad.IDCargo = lector.IsDBNull(lector.GetOrdinal("IDCargo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCargo"));
                        entidad.Cargo = new Cargo();
                        entidad.Cargo.CAR_Nombre = lector.IsDBNull(lector.GetOrdinal("CAR_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("CAR_Nombre"));
                        
                        entidad.IDDistrito = lector.IsDBNull(lector.GetOrdinal("IDDistrito")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDDistrito"));
                        entidad.Distrito = new Distrito();
                        entidad.Distrito.DIS_Nombre = lector.IsDBNull(lector.GetOrdinal("DIS_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("DIS_Nombre"));

                        entidad.PER_Codigo = lector.IsDBNull(lector.GetOrdinal("PER_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Codigo"));
                        entidad.PER_Nombres = lector.IsDBNull(lector.GetOrdinal("PER_Nombres")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Nombres"));
                        entidad.PER_Apellidos = lector.IsDBNull(lector.GetOrdinal("PER_Apellidos")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Apellidos"));
                        entidad.PER_DNI = lector.IsDBNull(lector.GetOrdinal("PER_DNI")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_DNI"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("PER_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Estado"));
                        
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

        public Trabajador Single(int id)
        {
            var trabajador = default(Trabajador);
            var comando = BaseDatos.GetStoredProcCommand("SelectTrabajador");

            BaseDatos.AddInParameter(comando, "IDPersonal", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
               while (lector.Read())
               {
                    trabajador = new Trabajador
                    {
                        IDPersonal = lector.IsDBNull(lector.GetOrdinal("IDPersonal")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDPersonal")),

                        IDCargo = lector.IsDBNull(lector.GetOrdinal("IDCargo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDCargo")),
                        //Cargo = new Cargo(),
                        NombreCargo = lector.IsDBNull(lector.GetOrdinal("CAR_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("CAR_Nombre")),

                        IDDistrito = lector.IsDBNull(lector.GetOrdinal("IDDistrito")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDDistrito")),
                        //Distrito = new Distrito(),
                        NombreDistrito= lector.IsDBNull(lector.GetOrdinal("DIS_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("DIS_Nombre")),                      
                        
                        PER_Codigo = lector.IsDBNull(lector.GetOrdinal("PER_Codigo")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Codigo")),
                        PER_Nombres = lector.IsDBNull(lector.GetOrdinal("PER_Nombres")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Nombres")),
                        PER_Apellidos = lector.IsDBNull(lector.GetOrdinal("PER_Apellidos")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Apellidos")),
                        PER_DNI = lector.IsDBNull(lector.GetOrdinal("PER_DNI")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_DNI")),
                        PER_Direccion = lector.IsDBNull(lector.GetOrdinal("PER_Direccion")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Direccion")),
                        Estado = lector.IsDBNull(lector.GetOrdinal("PER_Estado")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_Estado")),
                      //  UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("PER_UsuarioCreacion")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_UsuarioCreacion")),
                      //  FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("PER_FechaHoraCreacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PER_FechaHoraCreacion")),
                      //  UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("PER_UsuarioModificacion")) ? default(string) : lector.GetString(lector.GetOrdinal("PER_UsuarioModificacion")),
                       // FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("PER_FechaHoraModificacion")) ? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("PER_FechaHoraModificacion"))

                        IDProvincia = lector.IsDBNull(lector.GetOrdinal("IDProvincia")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDProvincia")),
                        NombreProvincia = lector.IsDBNull(lector.GetOrdinal("PRO_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("PRO_Nombre")),
                        IDDepartamento = lector.IsDBNull(lector.GetOrdinal("IDDepartamento")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDDepartamento")),
                        NombreDepartamento = lector.IsDBNull(lector.GetOrdinal("DEP_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("DEP_Nombre")),
                        IDPais = lector.IsDBNull(lector.GetOrdinal("IDPais")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IDPais")),
                        NombrePais = lector.IsDBNull(lector.GetOrdinal("PAI_Nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("PAI_Nombre")),
                    };
               }
            }
            comando.Dispose();
            return trabajador;
        }

        public int Count(string where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountTrabajador");

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

        public int Add(Trabajador trabajador)
        {
            try
            {
                var comando = BaseDatos.GetStoredProcCommand("InsertTrabajador");
                BaseDatos.AddOutParameter(comando, "IDPersonal", DbType.Int32, 10);
                BaseDatos.AddInParameter(comando, "IDCargo", DbType.String, trabajador.IDCargo);
                BaseDatos.AddInParameter(comando, "IDDistrito", DbType.String,
                                         (trabajador.Distrito.IDDistrito == "0"
                                              ? DBNull.Value as object
                                              : trabajador.Distrito.IDDistrito));
                BaseDatos.AddInParameter(comando, "PER_Codigo", DbType.String, trabajador.PER_Codigo);
                BaseDatos.AddInParameter(comando, "PER_Nombres", DbType.String, trabajador.PER_Nombres);
                BaseDatos.AddInParameter(comando, "PER_Apellidos", DbType.String, trabajador.PER_Apellidos);
                BaseDatos.AddInParameter(comando, "PER_DNI", DbType.String, trabajador.PER_DNI);
                BaseDatos.AddInParameter(comando, "PER_Direccion", DbType.String, trabajador.PER_Direccion);
                BaseDatos.AddInParameter(comando, "PER_Estado", DbType.String, trabajador.Estado);
                BaseDatos.AddInParameter(comando, "PER_UsuarioCreacion", DbType.String, trabajador.UsuarioCreacion);
                BaseDatos.AddInParameter(comando, "PER_UsuarioModificacion", DbType.String,
                                         trabajador.UsuarioModificacion);

                var resultado = BaseDatos.ExecuteNonQuery(comando);
                var valorDevuelto = (int) BaseDatos.GetParameterValue(comando, "IDPersonal");
                comando.Dispose();
                return valorDevuelto;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Update(Trabajador trabajador)
        {
            try
            {
                var comando = BaseDatos.GetStoredProcCommand("UpdateTrabajador");
                BaseDatos.AddInParameter(comando, "IDPersonal", DbType.Int32, trabajador.IDPersonal);
                BaseDatos.AddInParameter(comando, "IDCargo", DbType.String, trabajador.IDCargo);
                BaseDatos.AddInParameter(comando, "IDDistrito", DbType.String,
                                         (trabajador.Distrito.IDDistrito == "0"
                                              ? DBNull.Value as object
                                              : trabajador.Distrito.IDDistrito));
                BaseDatos.AddInParameter(comando, "PER_Codigo", DbType.String, trabajador.PER_Codigo);
                BaseDatos.AddInParameter(comando, "PER_Nombres", DbType.String, trabajador.PER_Nombres);
                BaseDatos.AddInParameter(comando, "PER_Apellidos", DbType.String, trabajador.PER_Apellidos);
                BaseDatos.AddInParameter(comando, "PER_DNI", DbType.String, trabajador.PER_DNI);
                BaseDatos.AddInParameter(comando, "PER_Direccion", DbType.String, trabajador.PER_Direccion);

                BaseDatos.AddInParameter(comando, "PER_Estado", DbType.String, trabajador.Estado);
                BaseDatos.AddInParameter(comando, "Per_UsuarioModificacion", DbType.String,
                                         trabajador.UsuarioModificacion);

                var resultado = BaseDatos.ExecuteNonQuery(comando);
                comando.Dispose();
                return resultado;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Delete(int id)
        {
            try
            {
                var comando = BaseDatos.GetStoredProcCommand("DeleteTrabajador");
                BaseDatos.AddInParameter(comando, "IDPersonal", DbType.Int32, id);

                var resultado = BaseDatos.ExecuteNonQuery(comando);

                comando.Dispose();
                return resultado;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        /*Inicio Metodo para Cargo*/
        public IList<Cargo> Search(string nombre)
        {
            var entidades = new List<Cargo>();
            var comando = BaseDatos.GetStoredProcCommand("SelectCargoNombre");
            BaseDatos.AddInParameter(comando, "CAR_Nombre", DbType.String, nombre);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Cargo
                                      {
                                          IDCargo = lector.IsDBNull(lector.GetOrdinal("IDCargo"))
                                                        ? default(int)
                                                        : lector.GetInt32(lector.GetOrdinal("IDCargo")),
                                          CAR_Codigo =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_Codigo"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_Codigo")),
                                          CAR_Nombre =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_Nombre"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_Nombre"))
                                      });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public string SearchNombre(int idCargo)
        {
            var comando = BaseDatos.GetStoredProcCommand("SelectCargoIDCargo");
            BaseDatos.AddInParameter(comando, "IDCargo", DbType.Int32, idCargo);
            var nombre = "";
            try
            {
                nombre = BaseDatos.ExecuteScalar(comando).ToString();
            }
            catch (Exception)
            {
                nombre = "";
            }

            comando.Dispose();
            return nombre;
        }
        /*Fin Metodo*/
    
    }
}
