using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Intertek.Business.Entity;
using Intertek.Business.Entity.Generics;
using Intertek.DataAccess.Interfaces;
using Intertek.DataAccess.Implementations;
using System.Collections;

namespace Intertek.Business.Logic
{
    public class RolOpcionSistemaBL : Singleton<RolOpcionSistemaBL>, IBaseLogic<RolOpcionSistema>
    {
        private readonly IRolOpcionSistemaRepository repository = new RolOpcionSistemaRepository();


        public IList<RolOpcionSistema> GetAll()
        {
            throw new NotImplementedException();
        }

        //public override IList<RolOpcionSistema> GetAll(int rol)
        //{
        //    try
        //    {
        //        IList<RolOpcionSistema> modulo = new RolOpcionSistemaRepository().GetAll(rol);
        //        if (modulo.Count > 0)
        //        { 
              
                
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //}

        public IList<RolOpcionSistema> GetAll(string sidx, string sord, int rows, int page, string where)
        {
            throw new NotImplementedException();
        }

        public RolOpcionSistema Single(int id)
        {
            throw new NotImplementedException();
        }

        public int Count(string where = "")
        {
            throw new NotImplementedException();
        }

        public int Add(RolOpcionSistema entity)
        {
            throw new NotImplementedException();
        }

        public int Update(RolOpcionSistema entity)
        {
            throw new NotImplementedException();
        }

        public int Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
