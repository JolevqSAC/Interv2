using System;

namespace Intertek.DataAccess
{
      internal static class  Utils
    {
        internal static string GetSqlDbType(string sqlDbType)
        {
            switch (sqlDbType.ToLower())
            {
                case "binary":
                    return "Binary";
                case "bigint":
                    return "BigInt";
                case "bit":
                    return "Bit";
                case "char":
                    return "Char";
                case "datetime":
                    return "DateTime";
                case "date":
                    return "Date";
                case "decimal":
                    return "Decimal";
                case "float":
                    return "Float";
                case "image":
                    return "Image";
                case "int":
                    return "Int";
                case "money":
                    return "Money";
                case "nchar":
                    return "NChar";
                case "ntext":
                    return "NText";
                case "nvarchar":
                    return "NVarChar";
                case "numeric":
                    return "Decimal";
                case "real":
                    return "Real";
                case "smalldatetime":
                    return "SmallDateTime";
                case "smallint":
                    return "SmallInt";
                case "smallmoney":
                    return "SmallMoney";
                case "sql_variant":
                    return "Variant";
                case "sysname":
                    return "VarChar";
                case "text":
                    return "Text";
                case "timestamp":
                    return "Timestamp";
                case "tinyint":
                    return "TinyInt";
                case "varbinary":
                    return "VarBinary";
                case "varchar":
                    return "VarChar";
                case "uniqueidentifier":
                    return "UniqueIdentifier";
                default:
                    throw (new Exception("Invalid SQL Server data type specified: " + sqlDbType));
            }
        }

        internal static string GetDbType(string type)
        {
            switch (type)
            {
                case "string":
                    return "DbType.String";
                case "bigint":
                    return "DbType.Int64";
                case "int":
                    return "DbType.Int32";
                case "UInt32":
                    return "DbType.UInt32";
                case "float":
                    return "DbType.Single";
                case "date":
                    return "DbType.Date";
                case "datetime":
                    return "DbType.DateTime";
                case "smallint":
                    return "DbType.Int16";
                case "byte":
                    return "DbType.Byte";
                case "object":
                    return "DbType.Object";
                case "money":
                    return "DbType.Currency";
                case "binary":
                    return "DbType.Binary";
                case "decimal":
                    return "DbType.Decimal";
                case "double":
                    return "DbType.Double";
                case "uniqueidentifier":
                    return "DbType.Guid";
                case "bit":
                    return "DbType.Boolean";
                case "char":
                    return "DbType.String";
                case "image":
                    return "DbType.Binary";
                case "nchar":
                    return "DbType.String";
                case "ntext":
                    return "DbType.String";
                case "nvarchar":
                    return "DbType.String";
                case "numeric":
                    return "DbType.Decimal";
                case "real":
                    return "DbType.Decimal";
                case "smalldatetime":
                    return "DbType.DateTime";
                case "smallmoney":
                    return "DbType.Single";
                case "sql_variant":
                    return "DbType.Binary";
                case "sysname":
                    return "DbType.String";
                case "text":
                    return "DbType.String";
                case "timestamp":
                    return "DbType.Time";
                case "tinyint":
                    return "DbType.Byte";
                case "varbinary":
                    return "DbType.Binary";
                case "varchar":
                    return "DbType.String";
                case "xml":
                    return "DbType.Xml";
                default:
                    throw (new Exception("Invalid data type specified: " + type));
            }
        }
       
       internal static string FormatPascal(string original)
        {
            original = original.Replace(" ", "");
            if (original.Length > 0)
            {
                return Char.ToUpper(original[0]) + original.Substring(1);
            }
            else
            {
                return String.Empty;
            }
        }
    }
}
