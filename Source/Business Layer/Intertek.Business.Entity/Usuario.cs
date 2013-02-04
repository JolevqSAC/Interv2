using System;
using System.Collections.Generic;
namespace Intertek.Business.Entity
{
    public class Usuario:BaseEntity
    {
        public int IdUsuario { get; set; }
        public int IdRole { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string PasswordQuestion { get; set; }
        public string PasswordAnswer { get; set; }
        public bool IsApproved { get; set; }    
        public DateTime LastActivityDate { get; set; }
        public DateTime LastLoginDate { get; set; }
        public DateTime LastPasswordChangedDate { get; set; }
        public bool IsOnline { get; set; }
        public bool IsLockedOut { get; set; }
        public DateTime LastLockedOutDate { get; set; }
        public string Comment { get; set; }
        public DateTime CreationDate { get; set; }
        public bool ChangePassword { get; set; }
        public bool LastLogin { get; set; }

        public Role Rol { get; set; }

        public IList<Modulo> Modulo { get; set; }
        public IList<MenuAdmin> Menus { get; set; }
      
    }
}
