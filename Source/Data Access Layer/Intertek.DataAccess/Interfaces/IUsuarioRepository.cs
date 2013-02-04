using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.Business.Entity.Repository;

namespace Intertek.DataAccess.Interfaces
{
    public interface IUsuarioRepository : IRepository<Usuario>
    {
        int GetNumberOfUsersOnline(int minutos);
        Usuario ObtenerPorUserName(string userName);
        Usuario ObtenerPorEmail(string email);
        bool IsUserInRole(string username, string roleName);
        IList<Usuario> GetUsersInRol(string roleName, string usernameToMatch);
        IList<Modulo> GetModulos(int idRol);
        IList<MenuAdmin> GetMenuByModulo(int idModulo);
    }
}
