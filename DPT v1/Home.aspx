<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DigitalPeaceTalks.Home" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Digital Peace Talks|Home</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <div id="wrapper">

        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <%
                            chkLogin();
                            if (loggedin) {
                            %>
                        <div class="dropdown profile-element">

                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="block m-t-xs font-bold"><%=user.DT.Rows[0]["Name"].ToString() %></span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="dropdown-item" href="profile.html">Profile</a></li>
                                <li><a class="dropdown-item" href="contacts.html">Contacts</a></li>
                                <li><a class="dropdown-item" href="mailbox.html">Mailbox</a></li>
                                <li class="dropdown-divider"></li>
                                <li><a runat="server" class="dropdown-item" onserverclick="logout">Logout</a></li>
                            </ul>
                        </div>
                        <%} %>
                        <div class="logo-element">
                            DPT
                        </div>
                    </li>

                </ul>

            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a>
                        <form role="search" class="navbar-form-custom" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="Search" class="form-control" name="top-search" id="top-search" />
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span class="m-r-sm text-muted welcome-message">Welcome to Digital Peace Talks</span>
                        </li>
                      <%if (loggedin)
                            { %>
                        <li class="dropdown" id="msg" runat="server">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i>
                            </a>
                        </li>
                        <li class="dropdown" id="bell" runat="server">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i>
                            </a>

                        </li>

                       
                        <li>
                            <a runat="server" onserverclick="logout">
                                <i class="fa fa-sign-out"></i>Log out
                            </a>
                        </li>
                     <%}
                         if (!loggedin)
                         {%>
                        <li>
                            <a href="Login.aspx">
                                Log in
                            </a>
                        </li>
                        <li>
                            <a href="Signup.aspx">
                                Register
                            </a>
                        </li>
                    <%} %>
                    </ul>

                </nav>
            </div>
            <form id="form" runat="server" method="post">
               
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="wrapper wrapper-content animated fadeInRight">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ibox ">
                                        
                                        <div class="ibox-content" style="min-height: -webkit-fill-available;">
                                            <div>
                                                <asp:Chart ID="Chart1" runat="server">
                                                    <Series>
                                                        <asp:Series Name="Series1"></asp:Series>
                                                        <asp:Series Name="Series2"></asp:Series>
                                                        <asp:Series Name="Series3"></asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1">
                                                            <AxisY>
                                                                <MajorGrid Enabled="False" />
                                                            </AxisY>
                                                            <AxisX>
                                                                <MajorGrid Enabled="false" />
                                                            </AxisX>
                                                        </asp:ChartArea>

                                                    </ChartAreas>
                                                </asp:Chart>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ibox">
                                        <div class="ibox-title">
                                            <h2>Ask a question</h2>
                                        </div>
                                        <div class="ibox-content">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtQtn" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="btnSubmitQtn" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmitQtn_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                           
<%if (loggedin)
    { %>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ibox ">
                                        <div class="ibox-content">
                                            You can also use a small chat in the right corner to enter live discussion.

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <% int i = 0;
                                    while (i < Questions.Rows.Count)
                                    {
                                        qstnId = Questions.Rows[i]["id"].ToString();
                                    %>
                                    <div class="ibox chat-view">

                                        <div class="ibox-title">
                                            <small class="float-right text-muted"><%=Questions.Rows[i]["Author"].ToString() %>  <%=Questions.Rows[i]["timestamp"].ToString() %></small>
                                            <a href="Posts.aspx?id=<%=qstnId%>"><%=Questions.Rows[i]["Question"].ToString() %></a>
                                        </div>




                                    </div>
                                    <%
                                        i++;
                                    }%>
                                </div>

                            </div>
<%} %>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSubmitQtn" />
                    </Triggers>

                </asp:UpdatePanel>
                
            </form>


        </div>
<%if (loggedin)
    { %>
        <div id="small-chat">

            <span class="badge badge-warning float-right">5</span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>

            </a>
        </div>
        <%} %>
    </div>



    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/summernote/summernote-bs4.js"></script>

    <script>
        $(document).ready(function () {

            $('.summernote').summernote();

        });

    </script>

</body>

</html>
