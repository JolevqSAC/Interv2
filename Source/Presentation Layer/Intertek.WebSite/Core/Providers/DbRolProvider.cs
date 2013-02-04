


namespace Intertek.WebSite.Core.Providers
{
    using System;
    using System.Collections.Specialized;
    using System.Configuration.Provider;
    using System.Web.Security;
    using System.Collections.Generic;
    using System.Linq;
    using Business.Entity;
    using Business.Logic;


    public class DbRolProvider : RoleProvider
    {
        #region Variables

        private string _appName;
        private string _sqlConnectionString;

        #endregion

        #region Propiedades

        /// <summary>
        /// Returns the application name as set in the web.config
        /// otherwise returns BlogEngine.  Set will throw an error.
        /// </summary>
        public override string ApplicationName
        {
            get { return _appName; }
            set { _appName = value; }
        }

        #endregion

        #region Metodos Publicos

        /// <summary>
        /// Initializes the provider
        /// </summary>
        /// <param name="name">Configuration name</param>
        /// <param name="config">Configuration settings</param>
        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            if (String.IsNullOrEmpty(name))
            {
                name = "DBRolProvider";
            }

            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "RoleSqlProvider_description");
            }
            base.Initialize(name, config);

            Security.GetIntValue(config, "commandTimeout", 60, true, 0);

            var temp = config["connectionStringName"];
            if (string.IsNullOrEmpty(temp))
            {
                throw new ProviderException("Connection_name_not_specified");
            }

            _sqlConnectionString = temp;
            if (string.IsNullOrEmpty(_sqlConnectionString))
            {
                throw new ProviderException("Connection_string_not_found, " + temp);
            }

            _appName = config["applicationName"];
            if (string.IsNullOrEmpty(_appName))
            {
                _appName = "/";
            }

            if (_appName.Length > 256)
            {
                throw new ProviderException("Provider_application_name_too_long");
            }

            config.Remove("connectionStringName");
            config.Remove("applicationName");
            config.Remove("commandTimeout");
            if (config.Count > 0)
            {
                var attribUnrecognized = config.GetKey(0);
                if (!String.IsNullOrEmpty(attribUnrecognized))
                    throw new ProviderException("Provider_unrecognized_attribute, " + attribUnrecognized);
            }
        }

        /// <summary>
        /// Check to see if user is in a role
        /// </summary>
        /// <param name="username"></param>
        /// <param name="roleName"></param>
        /// <returns></returns>
        public override bool IsUserInRole(string username, string roleName)
        {
            try
            {
                Security.CheckParameter(ref roleName, true, true, true, 40, "roleName");
                Security.CheckParameter(ref username, true, true, true, 40, "username");

                return UsuarioBL.Instancia.IsUserInRole(username, roleName);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// Return an array of roles that user is in
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public override string[] GetRolesForUser(string username)
        {
            try
            {
                Security.CheckParameter(ref username, true, true, true, 40, "username");

                var usuario = UsuarioBL.Instancia.ObtenerPorUserName(username);
                return usuario.Rol == null ? null : new string[] { usuario.Rol.Name };
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// Adds a new role to the database
        /// </summary>
        /// <param name="roleName"></param>
        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Removes a role from database
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="throwOnPopulatedRole"></param>
        /// <returns></returns>
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Checks to see if role exists
        /// </summary>
        /// <param name="roleName"></param>
        /// <returns></returns>
        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Adds all users in user array to all roles in role array
        /// </summary>
        /// <param name="usernames"></param>
        /// <param name="roleNames"></param>
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Removes all users in user array from all roles in role array
        /// </summary>
        /// <param name="usernames"></param>
        /// <param name="roleNames"></param>
        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Returns array of users in selected role
        /// </summary>
        /// <param name="roleName"></param>
        /// <returns></returns>
        public override string[] GetUsersInRole(string roleName)
        {
            try
            {
                Security.CheckParameter(ref roleName, true, true, true, 40, "roleName");

               IList<Usuario> users = UsuarioBL.Instancia.GetUsersInRol(roleName,string.Empty);

                return users.Select(obj => obj.UserName).ToArray();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// Returns array of all roles in database
        /// </summary>
        /// <returns></returns>
        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Returns all users in selected role with names that match usernameToMatch
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="usernameToMatch"></param>
        /// <returns></returns>
        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            try
            {
                Security.CheckParameter(ref roleName, true, true, true, 40, "roleName");
                Security.CheckParameter(ref usernameToMatch, true, true, false, 256, "usernameToMatch");

                IList<Usuario> users = UsuarioBL.Instancia.GetUsersInRol(roleName, usernameToMatch);

                return (users == null) ? null : users.Select(obj => obj.UserName).ToArray();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        #endregion
    }
}