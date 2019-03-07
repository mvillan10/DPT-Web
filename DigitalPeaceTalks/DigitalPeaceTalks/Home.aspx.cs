using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace DigitalPeaceTalks
{
    public partial class Home : System.Web.UI.Page
    {
        public DBC user = new DBC();
        DBC qstn;
        public bool loggedin;
        public string qstnId;
        public DataTable Questions;
        public DataTable Posts;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Questions = new DataTable();

            if (!IsPostBack)
            {
                chkLogin();
                if (loggedin)
                    user.ExcecuteQuery("select * from UserTable where UserID='" + Session["usr"] + "'");
                DBC load = new DBC();
                load.ExcecuteQuery("Select * from Questions");
                Questions = load.DT;

                DBC chart = new DBC();
                Random random = new Random();
                chart.ExcecuteQuery("select * from Chart t1 inner join Questions t2 on t1.Qid=t2.id");
                Chart1.Series[0].ChartType = SeriesChartType.Bubble;
                Chart1.Series[0].MarkerStyle = MarkerStyle.Circle;
                Chart1.Series[1].ChartType = SeriesChartType.Bubble;
                Chart1.Series[1].MarkerStyle = MarkerStyle.Circle;
                Chart1.Series[2].ChartType = SeriesChartType.Bubble;
                Chart1.Series[2].MarkerStyle = MarkerStyle.Circle;
                Chart1.ChartAreas[0].AxisX.MinorGrid.Enabled = false;
                Chart1.ChartAreas[0].AxisX.MajorTickMark.Enabled = false;
                Chart1.ChartAreas[0].AxisX.MinorTickMark.Enabled = false;
                Chart1.ChartAreas[0].AxisX.Interval = 0;

                Chart1.ChartAreas[0].AxisX.LabelStyle.ForeColor = Color.White;
                Chart1.ChartAreas[0].AxisY.LabelStyle.Enabled = false;

                Chart1.ChartAreas[0].AxisY.MajorTickMark.Enabled = false;
                Chart1.ChartAreas[0].AxisY.MinorTickMark.Enabled = false;

                Chart1.ChartAreas[0].AxisX.LineWidth = 0;
                Chart1.ChartAreas[0].AxisY.LineWidth = 0;
                Chart1.DataSource = chart.DT;
                Chart1.Series[0].XValueMember = "nature";
                Chart1.Series[0].YValueMembers = "size";
                Chart1.Series[1].XValueMember = "food";
                Chart1.Series[1].YValueMembers = "size";
                Chart1.Series[2].XValueMember = "animal";
                Chart1.Series[2].YValueMembers = "size";
                Chart1.DataBind();
                int i = 0;
                foreach (DataPoint d in Chart1.Series[0].Points)
                {
                    d.ToolTip = chart.DT.Rows[i]["Question"].ToString();
                    i++;
                }
                int j = 0;
                foreach (DataPoint d in Chart1.Series[1].Points)
                {
                    d.ToolTip = chart.DT.Rows[j]["Question"].ToString();
                    j++;
                }
                int k = 0;
                foreach (DataPoint d in Chart1.Series[2].Points)
                {
                    d.ToolTip = chart.DT.Rows[k]["Question"].ToString();
                    k++;
                }
            }
            Posts = new DataTable();
        }

        public void getPosts(int id)
        {
            DBC getPost = new DBC();
            getPost.ExcecuteQuery("Select * from Posts where Qid='" + id + "'");
            Posts.Reset();
            Posts = getPost.DT;
        }

        protected void btnSubmitQtn_Click(object sender, EventArgs e)
        {
            chkLogin();
            if (loggedin)
            {
                if (txtQtn.Text != "")
                {
                    int id = getQId();
                    qstn = new DBC();
                    qstn.ExcecuteNonQuery("Insert into Questions values('" + Session["usr"] + "','" + txtQtn.Text + "','" + id + "','" + DateTime.Now + "')");
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public int getQId()
        {
            int newId;
            DBC getid = new DBC();
            getid.ExcecuteQuery("Select max(id) from Questions");
            if (getid.DT.Rows.Count > 0 && getid.DT.Rows[0][0].ToString() != "")
            {
                newId = Convert.ToInt32(getid.DT.Rows[0][0].ToString()) + 1;
                return newId;
            }
            return 00;
        }

        public void chkLogin()
        {
            if (Session["usr"] == null)
            {
                loggedin = false;
            }
            else
                loggedin = true;
        }

        public void logout(object sender, EventArgs e)
        {
            Session["usr"] = null;
            Response.Redirect("Home.aspx");
        }

        //protected void btnPost_Click(object sender, EventArgs e)
        //{
        //    if (txtPost.Value != "")
        //    {
        //        string something = hiddenId.Value;

        //            posts = new DBC();
        //        int id = getPId();
        //        posts.ExcecuteNonQuery("insert into Posts values('" + userId + "','" + id + "','" + hiddenId.Value + "','" + txtPost.Value + "')");
        //        txtPost.InnerText = "";
        //    }
        //}
    }
}