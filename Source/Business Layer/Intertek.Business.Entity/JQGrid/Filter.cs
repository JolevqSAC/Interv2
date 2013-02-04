using System.Collections.Generic;

namespace Intertek.Business.Entity.JQGrid
{
    public class Filter
    {
        public string groupOp { get; set; }

        public List<Rule> rules { get; set; }
    }
}