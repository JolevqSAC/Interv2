using System;
using System.Collections.Generic;
using Intertek.Business.Entity;
using Intertek.Business.Entity.Generics;
using Intertek.DataAccess.Implementations;
using Intertek.DataAccess.Interfaces;

namespace Intertek.Business.Logic
{
    public class UsuarioBL : Singleton<UsuarioBL>, IBaseLogic<Usuario>
    {
        private readonly IUsuarioRepository repository = new UsuarioRepository();

        #region IBaseLogic<Usuario> Members

        public int Add(Usuario item)
        {
            try
            {
                return repository.Add(item);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Delete(int idEntidad)
        {
            try
            {
                return repository.Delete(idEntidad);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Update(Usuario item)
        {
            try
            {
                return repository.Update(item);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IList<Usuario> GetAll()
        {
            try
            {
                return repository.GetAll();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IList<Usuario> GetAll(string sidx, string sord, int rows, int page, string @where)
        {

            return repository.GetAll(sidx, sord, rows, page, @where);
        }

        public IList<Usuario> GetUsersInRol(string roleName, string usernameToMatch)
        {
            return repository.GetUsersInRol(roleName, usernameToMatch);
        }


        public Usuario Single(int idEntidad)
        {
            try
            {
                return repository.Single(idEntidad);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int Count(string whereCondition = null)
        {
            try
            {
                return whereCondition == null ? repository.Count() : repository.Count(whereCondition);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int GetNumberOfUsersOnline(int minutos)
        {
            try
            {
                return repository.GetNumberOfUsersOnline(minutos);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Usuario ObtenerPorUserName(string userName)
        {
            try
            {
                return repository.ObtenerPorUserName(userName);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Usuario ObtenerPorEmail(string email)
        {
            try
            {
                return repository.ObtenerPorEmail(email);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public bool IsUserInRole(string username, string roleName)
        {
            try
            {
                return repository.IsUserInRole(username, roleName);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IList<Modulo> GetModulos(int idRol,string cultura)
        {
            try
            {
                return repository.GetModulos(idRol);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IList<MenuAdmin> GetMenuByModulo(int idModulo,string cultura) 
        {
            try
            {
                return repository.GetMenuByModulo(idModulo);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion IBaseLogic<Usuario> Members
    }
}
