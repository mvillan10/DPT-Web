using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;

namespace DigitalPeaceTalks
{
    public partial class ADW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void calculate(object sender, EventArgs e)
        {
            var client = new RestClient("https://research.democracy.ovh/argument/adw");
            var request = new RestRequest(Method.POST);
            request.AddHeader("Postman-Token", "c8034566-103c-4bea-9ffd-6f3deb32eca2");
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("undefined", "{\r\n  \"text1\": \""+txtFirst.Value+"\",\r\n  \"text2\": \""+txtSecond.Value+"\"\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);

            score.InnerHtml = response.Content;
        }
    }
}