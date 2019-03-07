<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DigitalPeaceTalks.Login" %>

<!DOCTYPE html>
     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Digital Peace Talks</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
    
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">DPT</h1>

            </div>
            <h3>Welcome to Digital Peace Talks</h3>
            <p>The Foundation for digital peace talks seeks to establish and promote peace by fostering software that enables all humans to enter a fairand meaningful discussion about the future of the world 

            </p>
            <p>Login in. To see it in action.</p>
            <form id="frmLogin" runat="server">
                
                <div class="form-group">
                    <input id="txtPassphrase" runat="server" type="text" class="form-control" placeholder="Passphrase" required="">
                </div>
                
                <button type="submit" id="btnLogin" runat="server" onserverclick="login" class="btn btn-primary block full-width m-b">Login</button>
                <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="Signup.aspx">Create an account</a>
            </form>
            
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    

</body>

</html>
