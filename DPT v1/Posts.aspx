<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Posts.aspx.cs" Inherits="DigitalPeaceTalks.Posts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Digital Peace Talks|Posts</title>

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
                        <div class="dropdown profile-element">

                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="block m-t-xs font-bold"><%=user.DT.Rows[0]["Name"].ToString() %></span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="dropdown-item" href="profile.html">Profile</a></li>
                                <li><a class="dropdown-item" href="contacts.html">Contacts</a></li>
                                <li><a class="dropdown-item" href="mailbox.html">Mailbox</a></li>
                                <li class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="login.html">Logout</a></li>
                            </ul>
                        </div>
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
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i>
                            </a>

                        </li>


                        <li>
                            <a runat="server" onserverclick="logout">
                                <i class="fa fa-sign-out"></i>Log out
                            </a>
                        </li>
                    </ul>

                </nav>
            </div>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-9">
                    <h2>Question</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="Home.aspx">Home</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>Question</strong>
                        </li>
                    </ol>
                </div>
            </div>
            <form id="form" runat="server" method="post">
                <div class="wrapper wrapper-content animated fadeInRight">


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

                            <div class="ibox chat-view">
<%if (Question.Rows.Count > 0)
        { %>
                                <div class="ibox-title">
                                    <small class="float-right text-muted"><%=Question.Rows[0]["Author"] %>  <%=Question.Rows[0]["timestamp"].ToString() %></small>
                                    <%=Question.Rows[0]["Question"].ToString() %>
                                </div>

                                
                                <div class="ibox-content">

                                    <div class="row">

                                        <div class="col-md-9 ">
                                            <div class="chat-discussion">
                                                <%
        int j = 0;
        while (j < Post.Rows.Count)
        {%>

                                                <div class="chat-message left">
                                                    <div class="message">
                                                        <a class="message-author"><%=Post.Rows[j]["Author"] %></a>
                                                        <span class="message-date"><%=Post.Rows[j]["timestamp"] %> </span>
                                                        <span class="message-content"><%=Post.Rows[j]["Post"]%>
                                                        </span>
                                                    </div>
                                                </div>
                                                  <%
            j++;
        } %>
                                            </div>
                                        </div>
                                      
                                        <div class="col-md-3">
                                            <div class="chat-users">

                                                 <%
        int i = 0;
        while (i < Post.Rows.Count)
        {%>
                                                <div class="users-list">
                                                    <div class="chat-user">

                                                        <div class="chat-user-name">
                                                            <a href="#"><%=Post.Rows[i]["Author"] %></a>
                                                        </div>
                                                    </div>



                                                </div>
 <%
                i++;
            }
        }%>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="chat-message-form">

                                                <div class="form-group">
                                                   
                                                    <textarea id="txtPost" runat="server" class="form-control message-input" name="message" placeholder="Enter a post"></textarea><br />
                                                    <asp:Button ID="btnPost" runat="server" CssClass="btn btn-primary" Text="Post" OnClick="btnPost_Click" />
                                                </div>

                                            </div>
                                        </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
            </form>


        </div>

        <div id="small-chat">

            <span class="badge badge-warning float-right">5</span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>

            </a>
        </div>
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



</body>
</html>
