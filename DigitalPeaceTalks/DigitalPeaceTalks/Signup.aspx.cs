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
    public partial class Signup : System.Web.UI.Page
    {
        DBC register = new DBC();
        DBC query = new DBC();

        public class RandomGenerator
        {
            // Generate a random number between two numbers    
            public int RandomNumber(int min, int max)
            {
                Random random = new Random();
                return random.Next(min, max);
            }

            // Generate a random string with a given size    
            public string RandomString(int size, bool lowerCase)
            {
                StringBuilder builder = new StringBuilder();
                Random random = new Random();
                char ch;
                for (int i = 0; i < size; i++)
                {
                    ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                    builder.Append(ch);
                }
                if (lowerCase)
                    return builder.ToString().ToLower();
                return builder.ToString();
            }

            // Generate a random password    
            public string RandomUserId()
            {
                StringBuilder builder = new StringBuilder();
                builder.Append(RandomString(4, true));
                builder.Append(RandomNumber(1000, 9999));
                builder.Append(RandomString(2, false));
                return builder.ToString();
            }
        }
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

        public void Register(object sender, EventArgs e)
        {
            string pp = txtPassphrase.Value;
            
            //if (!chkAgree.Checked)
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please agree to the terms and policy to continue')", true);
            //    return;
            //}
            if (pp.Length > 10)
            {
                if (check(pp))
                {
                    RandomGenerator obj = new RandomGenerator();
                    string UserId = obj.RandomUserId();
                    string pass = Encrypt(pp);
                    register.ExcecuteNonQuery("Insert into UserTable values('"+UserId+"','"+pass+"','"+txtEmail.Value+"','"+txtName.Value+"')");
                    if (register.error != null)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + register.error + "')", true);
                        return;
                    }

                    Response.Redirect("Login.aspx");
                }
            }
        }

        public bool check(string pp)
        {
            string data=Encrypt(pp);
            query.ExcecuteQuery("Select * from UserTable where Pass='" + data + "'");
            if (query.DT.Rows.Count > 0)
                return false;
            else
                return true;
        }
    }
}