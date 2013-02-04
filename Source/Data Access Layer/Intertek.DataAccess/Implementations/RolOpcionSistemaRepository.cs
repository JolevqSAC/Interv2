using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity;
using System.Data;

namespace Intertek.DataAccess.Implementations
{
    public class RolOpcionSistemaRepository : Repository, IRolOpcionSistemaRepository
    {
      

        public IList<RolOpcionSistema> GetAll()
        {
            throw new NotImplementedException();
        }

        public  IList<RolOpcionSistema> GetRolOpcionSistemaPorRol(int rol)
        {

            IList<RolOpcionSistema> entidades = new List<RolOpcionSistema>();

            var comando = BaseDatos.GetStoredProcCommand("GetRolOpcionSistemaPorRol");

            BaseDatos.AddInParameter(comando, "IdRol", DbType.Int32, rol);

            try
            {
                using (var lector = BaseDatos.ExecuteReader(comando))
                {
                    while (lector.Read())
                    {
                        var entidad = new RolOpcionSistema();                       

                       entidad.IDRolOpcionSistema = lector.IsDBNull(lector.GetOrdinal("IDRolOpcionSistema"))? default(int) : lector.GetInt32(lector.GetOrdinal("IDRolOpcionSistema"));
						entidad.IDRol = lector.IsDBNull(lector.GetOrdinal("IDRol"))? default(int) : lector.GetInt32(lector.GetOrdinal("IDRol"));
						entidad.IDOpcionSistema = lector.IsDBNull(lector.GetOrdinal("IDOpcionSistema"))? default(int) : lector.GetInt32(lector.GetOrdinal("IDOpcionSistema"));
						entidad.ROS_FechaAsignacion = lector.IsDBNull(lector.GetOrdinal("ROS_FechaAsignacion"))? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ROS_FechaAsignacion"));
						entidad.Estado = lector.IsDBNull(lector.GetOrdinal("ROS_Estado"))? default(string) : lector.GetString(lector.GetOrdinal("ROS_Estado"));
						entidad.UsuarioCreacion = lector.IsDBNull(lector.GetOrdinal("ROS_UsuarioCreacion"))? default(string) : lector.GetString(lector.GetOrdinal("ROS_UsuarioCreacion"));
						entidad.FechaHoraCreacion = lector.IsDBNull(lector.GetOrdinal("ROS_FechaHoraCreacion"))? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ROS_FechaHoraCreacion"));
						entidad.UsuarioModificacion = lector.IsDBNull(lector.GetOrdinal("ROS_UsuarioModificacion"))? default(string) : lector.GetString(lector.GetOrdinal("ROS_UsuarioModificacion"));
						entidad.FechaHoraModificacion = lector.IsDBNull(lector.GetOrdinal("ROS_FechaHoraModificacion"))? default(DateTime) : lector.GetDateTime(lector.GetOrdinal("ROS_FechaHoraModificacion"));
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
        public IList<Business.Entity.RolOpcionSistema> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public Business.Entity.RolOpcionSistema Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(Business.Entity.RolOpcionSistema entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Business.Entity.RolOpcionSistema entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }


        


    }
}
