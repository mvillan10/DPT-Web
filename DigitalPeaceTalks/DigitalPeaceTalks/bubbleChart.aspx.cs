using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace DigitalPeaceTalks
{
    public partial class bubbleChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBC chart = new DBC();
            Random random = new Random();
            chart.ExcecuteQuery("select * from Chart t1 inner join Questions t2 on t1.Qid=t2.id");
            Chart1.Series[0].ChartType = SeriesChartType.Bubble;
            Chart1.Series[0].MarkerStyle = MarkerStyle.Circle;
            Chart1.Series[1].ChartType = SeriesChartType.Bubble;
            Chart1.Series[1].MarkerStyle = MarkerStyle.Circle;
            Chart1.Series[2].ChartType = SeriesChartType.Bubble;
            Chart1.Series[2].MarkerStyle = MarkerStyle.Circle;
            Chart1.DataSource = chart.DT;
            Chart1.Series[0].XValueMember = "nature";
            Chart1.Series[0].YValueMembers = "size";
            Chart1.Series[1].XValueMember = "food";
            Chart1.Series[1].YValueMembers = "size";
            Chart1.Series[2].XValueMember = "animal";
            Chart1.Series[2].YValueMembers = "size";
            Chart1.DataBind();
            int i = 0;
            foreach(DataPoint d in Chart1.Series[0].Points)
            {
                d.ToolTip = chart.DT.Rows[i]["Question"].ToString();
                i++;
            }
            int j = 0;
            foreach (DataPoint d in Chart1.Series[1].Points)
            {
                d.ToolTip = chart.DT.Rows[i]["Question"].ToString();
                j++;
            }
            int k = 0;
            foreach (DataPoint d in Chart1.Series[1].Points)
            {
                d.ToolTip = chart.DT.Rows[i]["Question"].ToString();
                k++;
            }




        }
    }
}