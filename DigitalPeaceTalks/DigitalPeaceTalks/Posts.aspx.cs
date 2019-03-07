using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using RestSharp;

namespace DigitalPeaceTalks
{
    public partial class Posts : System.Web.UI.Page
    {
        public DBC user;
        DBC qstn;
        DBC posts;
        DBC action;
        public int qstnId = 0;
        public DataTable Question;
        public DataTable Post;
        string userId;
        public bool loggedin;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                chkLogin();
                if (!loggedin)
                {
                    Response.Redirect("Home.aspx");
                }
                Question = new DataTable();
                Post = new DataTable();
                if (Request.QueryString["id"] != null)
                    Session["qid"] = Request.QueryString["id"].ToString();
                user = new DBC();
                user.ExcecuteQuery("Select * from UserTable where UserID='" + Session["usr"] + "'");
                if (user.DT.Rows.Count > 0)
                {
                    userId = Session["usr"].ToString();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login to access')", true);
                    Response.Redirect("Login.aspx");
                }
                if (Session["qid"] != null)
                {
                    posts = new DBC();
                    qstn = new DBC();
                    if (Request.QueryString["id"] != null)
                        Session["qid"] = Request.QueryString["id"].ToString();
                    qstn.ExcecuteQuery("Select * from Questions where id='" + Session["qid"] + "'");
                    Question = qstn.DT;
                    posts.ExcecuteQuery("Select * from posts where Qid='" + Session["qid"] + "'");
                    Post = posts.DT;
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
        public int getPId()
        {
            int newId;
            DBC getid = new DBC();
            getid.ExcecuteQuery("Select max(Pid) from Posts");
            if (getid.DT.Rows.Count > 0 && getid.DT.Rows[0][0].ToString() != "")
            {
                newId = Convert.ToInt32(getid.DT.Rows[0][0].ToString()) + 1;
                return newId;
            }
            return 00;
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (txtPost.Value != "")
            {
                int id = getPId();
                action = new DBC();
                action.ExcecuteNonQuery("insert into Posts values('" + Session["usr"] + "','" + id + "','" + Session["qid"] + "','" + txtPost.Value + "','" + DateTime.Now + "')");
                insert();
                Response.Redirect("Home.aspx");
            }
        }

        public void insert()
        {
            if (Request.QueryString["id"] != null)
                Session["qid"] = Request.QueryString["id"].ToString();
            DBC check = new DBC();
            check.ExcecuteQuery("Select * from Chart where Qid='" + Session["qid"] + "'");
            DBC q = new DBC();
            q.ExcecuteQuery("select * from Questions where id='" + Session["qid"] + "'");
            if (check.DT.Rows.Count == 0)
            {
                double score = getADW(q.DT.Rows[0]["Question"].ToString(), txtPost.Value);
                double animal = getADW(q.DT.Rows[0]["Question"].ToString() + " " + txtPost.Value, "Animal#n Wild#n");
                double nature = getADW(q.DT.Rows[0]["Question"].ToString() + " " + txtPost.Value, "Nature#n");
                double food = getADW(q.DT.Rows[0]["Question"].ToString() + " " + txtPost.Value, "Food#n");

                if (animal > nature && animal > food)
                {
                    check.ExcecuteNonQuery("insert into Chart values('','" + animal + "','','" + score + "','" + Session["qid"] + "')");
                }
                else if (nature > animal && nature > food)
                {
                    check.ExcecuteNonQuery("insert into Chart values('" + nature + "','','','" + score + "','" + Session["qid"] + "')");
                }
                else
                    check.ExcecuteNonQuery("insert into Chart values('','','" + food + "','" + score + "','" + Session["qid"] + "')");

            }
        }

        public double getADW(string a, string b)
        {
            var client = new RestClient("https://research.democracy.ovh/argument/adw");
            var request = new RestRequest(Method.POST);
            request.AddHeader("Postman-Token", "c8034566-103c-4bea-9ffd-6f3deb32eca2");
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("undefined", "{\r\n  \"text1\": \"" + a + "\",\r\n  \"text2\": \"" + b + "\"\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);

            string result = response.Content;
            string final;
            try
            {
                final = result.Substring(9, 12);
            }
            catch (Exception ex)
            {
                final = "0";
            }
            return Convert.ToDouble(final);
        }

        public void logout(object sender, EventArgs e)
        {
            Session["usr"] = null;
            Response.Redirect("Home.aspx");
        }
        public void chkLogin()
        {
            if (Request.QueryString["id"] != null)
                Session["qid"] = Request.QueryString["id"].ToString();
            if (Session["qid"] == null)
            {
                loggedin = false;
            }
            else
                loggedin = true;
        }
    }
}