using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;

namespace Intertek.DataAccess.Implementations
{
    public class CargoRepository : Repository, ICargoRepository
    {
        #region "Attributes"

        #endregion "Attributes"

        #region Métodos

        #region Metodos Publicos

        public IList<Cargo> GetAll()
        {
            var entidades = new List<Cargo>();
            var comando = BaseDatos.GetStoredProcCommand("SelectAllCargo");

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    entidades.Add(new Cargo
                                      {
                                          IDCargo =
                                              lector.IsDBNull(lector.GetOrdinal("IDCargo"))
                                                  ? default(int)
                                                  : lector.GetInt32(lector.GetOrdinal("IDCargo")),
                                          CAR_Codigo =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_Codigo"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_Codigo")),
                                          CAR_Nombre =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_Nombre"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_Nombre")),
                                          CAR_Descripcion =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_Descripcion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_Descripcion")),
                                          Estado =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_Estado"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_Estado")),
                                          UsuarioCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_UsuarioCreaccion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_UsuarioCreaccion")),
                                          FechaHoraCreacion =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_FechaHoraCreacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CAR_FechaHoraCreacion")),
                                          UsuarioModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_UsuarioModificacion"))
                                                  ? default(string)
                                                  : lector.GetString(lector.GetOrdinal("CAR_UsuarioModificacion")),
                                          FechaHoraModificacion =
                                              lector.IsDBNull(lector.GetOrdinal("CAR_FechaHoraModificacion"))
                                                  ? default(DateTime)
                                                  : lector.GetDateTime(lector.GetOrdinal("CAR_FechaHoraModificacion")),
                                          IDArea =
                                              lector.IsDBNull(lector.GetOrdinal("IDArea"))
                                                  ? default(int)
                                                  : lector.GetInt32(lector.GetOrdinal("IDArea"))
                                      });
                }
            }
            comando.Dispose();
            return entidades;
        }

        public IList<Cargo> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            IList<Cargo> entidades = new List<Cargo>();

            var comando = BaseDatos.GetStoredProcCommand("SelectPaginationCargo");
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
                        var entidad = new Cargo();
                        entidad.IDCargo = lector.IsDBNull(lector.GetOrdinal("IDCargo"))
                                              ? default(int)
                                              : lector.GetInt32(lector.GetOrdinal("IDCargo"));
                        entidad.CAR_Codigo = lector.IsDBNull(lector.GetOrdinal("CAR_Codigo"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CAR_Codigo"));
                        entidad.CAR_Descripcion = lector.IsDBNull(lector.GetOrdinal("CAR_Descripcion"))
                                                      ? default(string)
                                                      : lector.GetString(lector.GetOrdinal("CAR_Descripcion"));
                        entidad.CAR_Nombre = lector.IsDBNull(lector.GetOrdinal("CAR_Nombre"))
                                                 ? default(string)
                                                 : lector.GetString(lector.GetOrdinal("CAR_Nombre"));
                        entidad.Estado = lector.IsDBNull(lector.GetOrdinal("CAR_Estado"))
                                             ? default(string)
                                             : lector.GetString(lector.GetOrdinal("CAR_Estado"));
                        entidad.IDArea = lector.IsDBNull(lector.GetOrdinal("IDArea"))
                                             ? default(int)
                                             : lector.GetInt32(lector.GetOrdinal("IDArea"));
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

        public Cargo Single(int id)
        {
            var cargo = default(Cargo);
            var comando = BaseDatos.GetStoredProcCommand("SelectCargo");

            BaseDatos.AddInParameter(comando, "IDCargo", DbType.Int32, id);

            using (var lector = BaseDatos.ExecuteReader(comando))
            {
                while (lector.Read())
                {
                    cargo = new Cargo
                                {
                                    IDCargo =
                                        lector.IsDBNull(lector.GetOrdinal("IDCargo"))
                                            ? default(int)
                                            : lector.GetInt32(lector.GetOrdinal("IDCargo")),
                                    CAR_Codigo =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_Codigo"))
                                            ? default(string)
                                            : lector.GetString(lector.GetOrdinal("CAR_Codigo")),
                                    CAR_Descripcion =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_Descripcion"))
                                            ? default(string)
                                            : lector.GetString(lector.GetOrdinal("CAR_Descripcion")),
                                    CAR_Nombre =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_Nombre"))
                                            ? default(string)
                                            : lector.GetString(lector.GetOrdinal("CAR_Nombre")),
                                    Estado =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_Estado"))
                                            ? default(string)
                                            : lector.GetString(lector.GetOrdinal("CAR_Estado")),
                                    UsuarioCreacion =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_UsuarioCreaccion"))
                                            ? default(string)
                                            : lector.GetString(lector.GetOrdinal("CAR_UsuarioCreaccion")),
                                    FechaHoraCreacion =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_FechaHoraCreacion"))
                                            ? default(DateTime)
                                            : lector.GetDateTime(lector.GetOrdinal("CAR_FechaHoraCreacion")),
                                    UsuarioModificacion =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_UsuarioModificacion"))
                                            ? default(string)
                                            : lector.GetString(lector.GetOrdinal("CAR_UsuarioModificacion")),
                                    FechaHoraModificacion =
                                        lector.IsDBNull(lector.GetOrdinal("CAR_FechaHoraModificacion"))
                                            ? default(DateTime)
                                            : lector.GetDateTime(lector.GetOrdinal("CAR_FechaHoraModificacion")),
                                    IDArea =
                                        lector.IsDBNull(lector.GetOrdinal("IDArea"))
                                            ? default(int)
                                            : lector.GetInt32(lector.GetOrdinal("IDArea"))
                                };
                }
            }
            comando.Dispose();
            return cargo;
        }

        public int Count(string where = "")
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("CountCargo");

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

        public int Add(Cargo cargo)
        {
            var comando = BaseDatos.GetStoredProcCommand("InsertCargo");
            BaseDatos.AddOutParameter(comando, "IDCargo", DbType.Int32, 10);
            BaseDatos.AddInParameter(comando, "CAR_Codigo", DbType.String, cargo.IDCargo);
            BaseDatos.AddInParameter(comando, "CAR_Descripcion", DbType.String, cargo.CAR_Descripcion);
            BaseDatos.AddInParameter(comando, "CAR_Nombre", DbType.String, cargo.CAR_Nombre);
            BaseDatos.AddInParameter(comando, "CAR_Estado", DbType.String, cargo.Estado);
            BaseDatos.AddInParameter(comando, "CAR_UsuarioCreaccion", DbType.String, cargo.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "CAR_UsuarioModificacion", DbType.String, cargo.UsuarioModificacion);
            BaseDatos.AddInParameter(comando, "IDArea", DbType.Int32, cargo.IDArea);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Agregar Cargo.");

            var valorDevuelto = (int) BaseDatos.GetParameterValue(comando, "IDCargo");
            comando.Dispose();
            return valorDevuelto;
        }

        public int Update(Cargo cargo)
        {
            var comando = BaseDatos.GetStoredProcCommand("UpdateCargo");
            BaseDatos.AddInParameter(comando, "IDCargo", DbType.Int32, cargo.IDCargo);
            BaseDatos.AddInParameter(comando, "CAR_Codigo", DbType.String, cargo.CAR_Codigo);
            BaseDatos.AddInParameter(comando, "CAR_Descripcion", DbType.String, cargo.CAR_Descripcion);
            BaseDatos.AddInParameter(comando, "CAR_Nombre", DbType.String, cargo.CAR_Nombre);
            BaseDatos.AddInParameter(comando, "CAR_Estado", DbType.String, cargo.Estado);
            BaseDatos.AddInParameter(comando, "CAR_UsuarioCreaccion", DbType.String, cargo.UsuarioCreacion);
            BaseDatos.AddInParameter(comando, "CAR_FechaHoraCreacion", DbType.DateTime, cargo.FechaHoraCreacion);
            BaseDatos.AddInParameter(comando, "CAR_UsuarioModificacion", DbType.String, cargo.UsuarioModificacion);
            BaseDatos.AddInParameter(comando, "CAR_FechaHoraModificacion", DbType.DateTime, cargo.FechaHoraModificacion);
            BaseDatos.AddInParameter(comando, "IDArea", DbType.Int32, cargo.IDArea);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Modificar Cargo.");

            comando.Dispose();
            return resultado;
        }

        public int Delete(int id)
        {
            var comando = BaseDatos.GetStoredProcCommand("DeleteCargo");
            BaseDatos.AddInParameter(comando, "IdCargo", DbType.Int32, id);

            var resultado = BaseDatos.ExecuteNonQuery(comando);
            if (resultado == 0) throw new Exception("Error al Eliminar Cargo.");
            comando.Dispose();
            return 1;
        }

        #endregion Metodos Publicos

        #endregion Métodos
    }
}
