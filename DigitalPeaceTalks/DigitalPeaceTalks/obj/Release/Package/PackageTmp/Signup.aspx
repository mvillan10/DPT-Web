<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DigitalPeaceTalks.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Digital Peace Talks|Register</title>

    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet"/>
    <link href="css/animate.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
</head>
<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">DPT</h1>

            </div>
            <h3>Signup to Digital Peace Talks</h3>
            <p>Create account to participate</p>
            <form id="frmRegister" runat="server">
                <div class="form-group">
                    <input id="txtName" runat="server" type="text" class="form-control" placeholder="Name" required=""/>
                </div>
                <div class="form-group">
                    <input id="txtEmail" runat="server" type="email" class="form-control" placeholder="Email" required=""/>
                </div>
                <div class="form-group">
                    <input id="txtPassphrase" runat="server" type="text" class="form-control form-control-lg" placeholder="Passphrase" required=""/>
                </div>
                <div class="form-group">
                        <div class="checkbox i-checks"><label> <asp:CheckBox ID="chkAgree" runat="server" /><i></i>     I agree the <a href="#">terms and policy</a></label></div>
                </div>
                
                <button id="btnRegister" runat="server" onserverclick="Register" type="submit" class="btn btn-primary block full-width m-b">Register</button>

                <p class="text-muted text-center"><small>Already have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="Login.aspx">Login</a>
                <div class="modal inmodal fade" id="mymodal" runat="server"  tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">Modal title</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p><strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
                                                printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
                                                remaining essentially unchanged.</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
            </form>
            
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
     <script type="text/javascript">
        function showModal() {
            $("#myModal").modal('show');
         }
         </script>
</body>
</html>
