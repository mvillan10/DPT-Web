using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DigitalPeaceTalks
{
    public class DBC
    {
        public SqlCommand sqlcommand;
        public DataSet ds = new DataSet();
        public static string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["DbConn"].ConnectionString;
        public SqlConnection conn = new SqlConnection(connstring);
        public SqlDataAdapter DA;
        public DataTable DT = new DataTable();
        public string error;

        public string OpenConnection()
        {
            try
            {
                conn.Open();

                return "Success";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        public void ExcecuteQuery(string strquery)
        {
            SqlCommand command = new SqlCommand(strquery, conn);
            SqlDataAdapter ODA = new SqlDataAdapter(command);
            try
            {
                ODA.Fill(ds);
                ODA.Fill(DT);

            }
            catch (Exception ex) {
                error = ex.Message;
            }

            conn.Close();

        }
        public void ExcecuteNonQuery(string strquery)
        {
            try
            {
                conn.Open();
                SqlCommand OSC = new SqlCommand(strquery, conn);
                OSC.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                error = ex.Message;
            }
            finally { conn.Close();}
           
            
        }
    }
}
