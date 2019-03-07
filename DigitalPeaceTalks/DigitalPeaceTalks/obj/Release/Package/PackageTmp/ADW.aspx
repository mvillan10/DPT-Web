<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADW.aspx.cs" Inherits="DigitalPeaceTalks.ADW" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Digital Peace Talks|ADW</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

</head>

<body class="gray-bg">

    <div class=" loginColumns wrapper wrapper-content animated fadeInDown">
        <div class="row">

            <div class="col-md-12">
                <h2 class="font-bold text-center">Welcome to ADW</h2>


                <div class="ibox-content">
                    <form id="form" runat="server" class="m-t">
                        <div class="form-group">
                            <input id="txtFirst" runat="server" type="text" class="form-control" placeholder="First sentence" required=""/>
                        </div>
                        <div class="form-group">
                            <input id="txtSecond" runat="server" type="text" class="form-control" placeholder="Second sentence" required=""/>
                        </div>
                        <button id="btnSubmit" runat="server" class="btn btn-primary block full-width m-b" onserverclick="calculate">Get ADW score</button>

                       
                      
                    </form>
                   <div class="form-group text-center">
                        <h2>The score is</h2><h2 id="score" runat="server"></h2>
                   </div>
                </div>
            </div>
        </div>
        <hr />
        
    </div>
</body>
</html>
