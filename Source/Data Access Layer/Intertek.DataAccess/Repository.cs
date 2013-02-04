using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Intertek.DataAccess
{
    public abstract class Repository
    {
        #region Atributos

        private string _connectionString;

        #endregion Atributos

        #region Propiedades

        public string ConnectionString
        {
            get
            {
                if (string.IsNullOrEmpty(_connectionString))
                {
                    _connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                }
                return _connectionString;
            }
            set { _connectionString = value; }
        }

        #endregion Propiedades

        #region Enterprise

        protected Database BaseDatos = DatabaseFactory.CreateDatabase("DefaultConnection");

        #endregion Enterprise
    }
}