using System;
using System.Collections.Generic;
using System.Data;
using Intertek.Business.Entity;
using Intertek.DataAccess.Interfaces;
using Intertek.Business.Entity.Enums;
using System.Globalization;

namespace Intertek.DataAccess.Implementations
{
    public class UsuarioRepository : Repository, IUsuarioRepository
    {
        #region "Attributes"

        #endregion "Attributes"
        private  string  Cultura { get; set; }

        #region Métodos

        #region Metodos Publicos

        public int Add(Usuario entity)
        {
            int resultado = 0;
            var comando = BaseDatos.GetStoredProcCommand("InsertUsuario");

            try
            {
                BaseDatos.AddOutParameter(comando, "IdUsuario", DbType.Int32, 4);
                BaseDatos.AddInParameter(comando, "Name", DbType.String, entity.Name);
                BaseDatos.AddInParameter(comando, "Username", DbType.String, entity.UserName);
                BaseDatos.AddInParameter(comando, "FirstName", DbType.String, entity.FirstName);
                BaseDatos.AddInParameter(comando, "LastName", DbType.String, entity.LastName);
                BaseDatos.AddInParameter(comando, "Email", DbType.String, entity.Email);
                BaseDatos.AddInParameter(comando, "Password", DbType.String, entity.Password);
                BaseDatos.AddInParameter(comando, "PasswordQuestion", DbType.String, entity.PasswordQuestion);
                BaseDatos.AddInParameter(comando, "PasswordAnswer", DbType.String, entity.PasswordAnswer);
                BaseDatos.AddInParameter(comando, "Comment", DbType.String, entity.Comment);
                resultado = BaseDatos.ExecuteNonQuery(comando);

                if (resultado == 0) throw new Exception("Error al Agregar Usuario.");

                resultado = (int)BaseDatos.GetParameterValue(comando, "IdUsuario");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            comando.Dispose();
            return resultado;
        }

        public int Count(string @where = "")
        {
            return 1;
        }

        public int Delete(int id)
        {
            return 1;
        }

        public int Update(Usuario entity)
        {
            int resultado = 0;
            var comando = BaseDatos.GetStoredProcCommand("UpdateUsuario");

            try
            {
                BaseDatos.AddInParameter(comando, "IdUser", DbType.Int32, entity.IdUsuario);
                BaseDatos.AddInParameter(comando, "ChangePassword", DbType.Boolean, entity.ChangePassword);
                BaseDatos.AddInParameter(comando, "LastLogin", DbType.Boolean, entity.LastLogin);
                BaseDatos.AddInParameter(comando, "Password", DbType.String, entity.Password);
                BaseDatos.AddInParameter(comando, "IsLockedOut", DbType.Boolean, entity.IsLockedOut);
                BaseDatos.ExecuteNonQuery(comando);

                resultado = entity.IdUsuario;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            comando.Dispose();
            return resultado;
        }

        public Usuario Single(int id)
        {
            Usuario entidad = new Usuario();
            return entidad;
        }

        public Usuario ObtenerPorUserName(string userName)
        {
            Usuario entidad = new Usuario();

            var comando = BaseDatos.GetStoredProcCommand("SelectUsuarioByUserName");
            BaseDatos.AddInParameter(comando, "@userName", DbType.String, userName);

            try
            {
                using (var dr = BaseDatos.ExecuteReader(comando))
                {
                    if (dr.Read())
                    {
                        entidad.IdUsuario = dr.IsDBNull(dr.GetOrdinal("IdUser")) ? 0 : dr.GetInt32(dr.GetOrdinal("IdUser"));
                        entidad.Name = dr.IsDBNull(dr.GetOrdinal("Name")) ? default(string) : dr.GetString(dr.GetOrdinal("Name"));
                        entidad.UserName = dr.IsDBNull(dr.GetOrdinal("UserName")) ? default(string) : dr.GetString(dr.GetOrdinal("UserName"));
                        entidad.FirstName = dr.IsDBNull(dr.GetOrdinal("FirstName")) ? default(string) : dr.GetString(dr.GetOrdinal("FirstName"));
                        entidad.LastName = dr.IsDBNull(dr.GetOrdinal("LastName")) ? default(string) : dr.GetString(dr.GetOrdinal("LastName"));
                        entidad.Email = dr.IsDBNull(dr.GetOrdinal("Email")) ? default(string) : dr.GetString(dr.GetOrdinal("Email"));
                        entidad.Password = dr.IsDBNull(dr.GetOrdinal("Password")) ? default(string) : dr.GetString(dr.GetOrdinal("Password"));
                        entidad.PasswordQuestion = dr.IsDBNull(dr.GetOrdinal("PasswordQuestion")) ? default(string) : dr.GetString(dr.GetOrdinal("PasswordQuestion"));
                        entidad.PasswordAnswer = dr.IsDBNull(dr.GetOrdinal("PasswordAnswer")) ? default(string) : dr.GetString(dr.GetOrdinal("PasswordAnswer"));
                        entidad.IsApproved = !dr.IsDBNull(dr.GetOrdinal("IsApproved")) && dr.GetBoolean(dr.GetOrdinal("IsApproved"));
                        entidad.LastActivityDate = dr.IsDBNull(dr.GetOrdinal("LastActivityDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastActivityDate"));
                        entidad.LastLoginDate = dr.IsDBNull(dr.GetOrdinal("LastLoginDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastLoginDate"));
                        entidad.LastPasswordChangedDate = dr.IsDBNull(dr.GetOrdinal("LastPasswordChangedDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastPasswordChangedDate"));
                        entidad.IsOnline = !dr.IsDBNull(dr.GetOrdinal("IsOnline")) && dr.GetBoolean(dr.GetOrdinal("IsOnline"));
                        entidad.IsLockedOut = !dr.IsDBNull(dr.GetOrdinal("IsLockedOut")) && dr.GetBoolean(dr.GetOrdinal("IsLockedOut"));
                        entidad.LastLockedOutDate = dr.IsDBNull(dr.GetOrdinal("LastLockedOutDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastLockedOutDate"));
                        entidad.Comment = dr.IsDBNull(dr.GetOrdinal("Comment")) ? default(string) : dr.GetString(dr.GetOrdinal("Comment"));
                        entidad.CreationDate = dr.IsDBNull(dr.GetOrdinal("CreationDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("CreationDate"));
                        entidad.Rol = new Role();
                        entidad.Rol.IdRole = dr.IsDBNull(dr.GetOrdinal("IdRole")) ? 0 : dr.GetInt32(dr.GetOrdinal("IdRole"));
                        entidad.Rol.Name = dr.IsDBNull(dr.GetOrdinal("RoleName")) ? default(string) : dr.GetString(dr.GetOrdinal("RoleName"));
                        entidad.IdRole = dr.IsDBNull(dr.GetOrdinal("IdRole")) ? 0 : dr.GetInt32(dr.GetOrdinal("IdRole"));
                    }

                    dr.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }

            comando.Dispose();

            return entidad;
        }

        public Usuario ObtenerPorEmail(string email)
        {
            Usuario entidad = new Usuario();

            var comando = BaseDatos.GetStoredProcCommand("SelectUsuarioByEmail");
            BaseDatos.AddInParameter(comando, "@email", DbType.String, email);

            try
            {
                using (var dr = BaseDatos.ExecuteReader(comando))
                {
                    if (dr.Read())
                    {
                        entidad.IdUsuario = dr.IsDBNull(dr.GetOrdinal("IdUser")) ? 0 : dr.GetInt32(dr.GetOrdinal("IdUser"));
                        entidad.Name = dr.IsDBNull(dr.GetOrdinal("Name")) ? default(string) : dr.GetString(dr.GetOrdinal("Name"));
                        entidad.UserName = dr.IsDBNull(dr.GetOrdinal("UserName")) ? default(string) : dr.GetString(dr.GetOrdinal("UserName"));
                        entidad.FirstName = dr.IsDBNull(dr.GetOrdinal("FirstName")) ? default(string) : dr.GetString(dr.GetOrdinal("FirstName"));
                        entidad.LastName = dr.IsDBNull(dr.GetOrdinal("LastName")) ? default(string) : dr.GetString(dr.GetOrdinal("LastName"));
                        entidad.Email = dr.IsDBNull(dr.GetOrdinal("Email")) ? default(string) : dr.GetString(dr.GetOrdinal("Email"));
                        entidad.Password = dr.IsDBNull(dr.GetOrdinal("Password")) ? default(string) : dr.GetString(dr.GetOrdinal("Password"));
                        entidad.PasswordQuestion = dr.IsDBNull(dr.GetOrdinal("PasswordQuestion")) ? default(string) : dr.GetString(dr.GetOrdinal("PasswordQuestion"));
                        entidad.PasswordAnswer = dr.IsDBNull(dr.GetOrdinal("PasswordAnswer")) ? default(string) : dr.GetString(dr.GetOrdinal("PasswordAnswer"));
                        entidad.IsApproved = !dr.IsDBNull(dr.GetOrdinal("IsApproved")) && dr.GetBoolean(dr.GetOrdinal("IsApproved"));
                        entidad.LastActivityDate = dr.IsDBNull(dr.GetOrdinal("LastActivityDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastActivityDate"));
                        entidad.LastLoginDate = dr.IsDBNull(dr.GetOrdinal("LastLoginDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastLoginDate"));
                        entidad.LastPasswordChangedDate = dr.IsDBNull(dr.GetOrdinal("LastPasswordChangedDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastPasswordChangedDate"));
                        entidad.IsOnline = !dr.IsDBNull(dr.GetOrdinal("IsOnline")) && dr.GetBoolean(dr.GetOrdinal("IsOnline"));
                        entidad.IsLockedOut = !dr.IsDBNull(dr.GetOrdinal("IsLockedOut")) && dr.GetBoolean(dr.GetOrdinal("IsLockedOut"));
                        entidad.LastLockedOutDate = dr.IsDBNull(dr.GetOrdinal("LastLockedOutDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("LastLockedOutDate"));
                        entidad.Comment = dr.IsDBNull(dr.GetOrdinal("Comment")) ? default(string) : dr.GetString(dr.GetOrdinal("Comment"));
                        entidad.CreationDate = dr.IsDBNull(dr.GetOrdinal("CreationDate")) ? DateTime.Now : dr.GetDateTime(dr.GetOrdinal("CreationDate"));
                        entidad.Rol = new Role();
                        entidad.Rol.IdRole = dr.IsDBNull(dr.GetOrdinal("IdRole")) ? 0 : dr.GetInt32(dr.GetOrdinal("IdRole"));
                        entidad.Rol.Name = dr.IsDBNull(dr.GetOrdinal("RoleName")) ? default(string) : dr.GetString(dr.GetOrdinal("RoleName"));
                    }

                    dr.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }

            comando.Dispose();

            return entidad;
        }

        public IList<Usuario> GetAll()
        {
            IList<Usuario> entidad = new List<Usuario>();
            return entidad;
        }

        public IList<Usuario> GetAll(string sidx, string sord, int rows, int page, string @where)
        {
            IList<Usuario> entidad = new List<Usuario>();
            return entidad;
        }

        public IList<Usuario> GetUsersInRol(string roleName, string usernameToMatch)
        {
            IList<Usuario> entidades = new List<Usuario>();

            var comando = BaseDatos.GetStoredProcCommand("SelectUsersInRol");
            BaseDatos.AddInParameter(comando, "@roleName", DbType.String, roleName);
            BaseDatos.AddInParameter(comando, "@usernameToMatch", DbType.String, usernameToMatch);

            try
            {
                using (var dr = BaseDatos.ExecuteReader(comando))
                {
                    while (dr.Read())
                    {
                        var entidad = new Usuario();
                        entidad.IdUsuario = dr.IsDBNull(dr.GetOrdinal("IdUser")) ? 0 : dr.GetInt32(dr.GetOrdinal("IdUser"));
                        entidad.UserName = dr.IsDBNull(dr.GetOrdinal("UserName")) ? default(string) : dr.GetString(dr.GetOrdinal("UserName"));
                        entidades.Add(entidad);
                    }

                    dr.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }

            comando.Dispose();
            return entidades;
        }

        public int GetNumberOfUsersOnline(int minutos)
        {
            int cantidad = 0;
            var comando = BaseDatos.GetStoredProcCommand("GetNumberOfUsersOnline");

            try
            {
                BaseDatos.AddInParameter(comando, "@Minutos", DbType.Int32, minutos);

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

        public bool IsUserInRole(string username, string roleName)
        {
            int estado = 0;
            var comando = BaseDatos.GetStoredProcCommand("IsUserInRole");

            try
            {
                BaseDatos.AddInParameter(comando, "@roleName", DbType.String, roleName);
                BaseDatos.AddInParameter(comando, "@username", DbType.String, username);

                using (var dr = BaseDatos.ExecuteReader(comando))
                {
                    if (dr.Read())
                    {
                        estado = dr.IsDBNull(dr.GetOrdinal("estado")) ? 0 : dr.GetInt32(dr.GetOrdinal("estado"));
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            comando.Dispose();

            return estado == 1;
        }


        public IList<Modulo> GetModulos(int idRol)
        {

            IList<Modulo> entidades = new List<Modulo>();
             var comando = BaseDatos.GetStoredProcCommand("GetModulosByRol");
             Cultura = (string)CultureInfo.CurrentCulture.Name;

             Cultura = (string)CultureInfo.InstalledUICulture.Name;


            BaseDatos.AddInParameter(comando, "IdRol", DbType.Int32, idRol);

            try
            {
                using (var lector = BaseDatos.ExecuteReader(comando))
                {
                    while (lector.Read())
                    {
                        var entidad = new Modulo();
                        entidad.IdModulo = lector.IsDBNull(lector.GetOrdinal("id")) ? default(int) : lector.GetInt32(lector.GetOrdinal("id"));
                         entidad.Nombre = lector.IsDBNull(lector.GetOrdinal("nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("nombre"));
                        entidad.Nombre_US = lector.IsDBNull(lector.GetOrdinal("Nombre_US")) ? default(string) : lector.GetString(lector.GetOrdinal("Nombre_US"));                    
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

        public IList<MenuAdmin> GetMenuByModulo(int idModulo)
        {

            IList<MenuAdmin> entidades = new List<MenuAdmin>();

            var comando = BaseDatos.GetStoredProcCommand("GetMenuByModulo");

            BaseDatos.AddInParameter(comando, "@IdModulo", DbType.Int32, idModulo);

            try
            {
                using (var lector = BaseDatos.ExecuteReader(comando))
                {
                    while (lector.Read())
                    {
                        var entidad = new MenuAdmin();
                        entidad.IdMenu = lector.IsDBNull(lector.GetOrdinal("IdMenu")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IdMenu"));
                        entidad.IdModulo = lector.IsDBNull(lector.GetOrdinal("IdModulo")) ? default(int) : lector.GetInt32(lector.GetOrdinal("IdModulo"));
                        entidad.Nombre = lector.IsDBNull(lector.GetOrdinal("nombre")) ? default(string) : lector.GetString(lector.GetOrdinal("nombre"));
                         entidad.Nombre_US = lector.IsDBNull(lector.GetOrdinal("Nombre_US")) ? default(string) : lector.GetString(lector.GetOrdinal("Nombre_US"));                    
                        entidad.Url = lector.IsDBNull(lector.GetOrdinal("url")) ? default(string) : lector.GetString(lector.GetOrdinal("url"));

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