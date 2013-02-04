using System;
using System.Runtime.Serialization;
using System.Security.Principal;

namespace Intertek.WebSite.Core.Providers
{
    [Serializable]
    public class CustomIdentity : IIdentity, ISerializable
    {
        public CustomIdentity(string name, int id)
        {
            IsAuthenticated = true;
            Name = name;
            UserId = id;
            AuthenticationType = "Forms";
        }

        public string AuthenticationType { get; private set; }

        public bool IsAuthenticated { get; private set; }

        public string Name { get; private set; }

        public int UserId { get; private set; }

        public void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            if (context.State == StreamingContextStates.CrossAppDomain)
            {
                GenericIdentity gIdent = new GenericIdentity(this.Name, this.AuthenticationType);
                info.SetType(gIdent.GetType());
                System.Reflection.MemberInfo[] serializableMembers;
                object[] serializableValues;
                serializableMembers = FormatterServices.GetSerializableMembers(gIdent.GetType());
                serializableValues = FormatterServices.GetObjectData(gIdent, serializableMembers);
                for (int i = 0; i < serializableMembers.Length; i++)
                {
                    info.AddValue(serializableMembers[i].Name, serializableValues[i]);
                }
            }
            else
            {
                throw new InvalidOperationException("Serialization not supported");
            }
        }
    }
}