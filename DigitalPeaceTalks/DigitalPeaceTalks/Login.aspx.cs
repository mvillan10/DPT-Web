using System;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalPeaceTalks
{
    public partial class Login : System.Web.UI.Page
    {
        DBC check = new DBC();
        public static string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new
                    Rfc2898DeriveBytes(EncryptionKey, new byte[]
                    { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        public void login(object sender, EventArgs e)
        {
           
            
                check.ExcecuteQuery("Select * from UserTable where Pass='" + Encrypt(txtPassphrase.Value) + "'");
                if (check.DT.Rows.Count > 0)
                {
                Session["usr"] = check.DT.Rows[0]["UserID"].ToString();
                    Response.Redirect("Home.aspx");
                }
                else
                {

                }
            
        }
    }
}   