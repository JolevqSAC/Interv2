using System.ComponentModel.DataAnnotations;

namespace Intertek.Business.Entity.Attributes
{
    public class BooleanRequiredAttribute : RequiredAttribute
    {
        public override bool IsValid(object value)
        {
            return value != null;
        }
    }
}