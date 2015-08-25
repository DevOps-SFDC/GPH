<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MBPS_Central.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <!-- Bootstrap Core CSS -->
    <link href="~/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="~/bootstrap/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet"/>

    <!-- Timeline CSS -->
    <link href="~/bootstrap/css/plugins/timeline.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="~/bootstrap/css/sb-admin-2.css" rel="stylesheet"/>

    <!-- Morris Charts CSS -->
    <link href="~/bootstrap/css/plugins/morris.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="~/bootstrap/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    
    <%-- jQuery UI CSS --%>
    <link href="~/Content/jquery-ui.css" rel="stylesheet" />

    <!-- Custom Overlay -->
    <link href="~/Content/overlay.css" rel="stylesheet"/>

    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <script type="text/javascript">

        function validateCheck() {
            var valid = true;
            var x = document.getElementById("txtUserName").value;
            var y = document.getElementById("txtPassword").value;
            if (x == "") {
                alert("Empty Lan ID..");
                valid = false;
            }
            else if (y == "") {
                alert("Empty Password..");
                valid = false;
            }
            return valid;
        } 
        </script>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In using your LAN ID</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" runat="server">
                            <fieldset>
                                <div class="form-group" >
                                    <asp:textbox id="txtUserName" runat="server" cssclass="form-control" placeholder="Lan ID" ClientIDMode="Static" />
                                   <%-- <input class="form-control" placeholder="Lan ID" name="email" type="email" autofocus="autofocus" />--%>
                                </div>
                                <div class="form-group" >
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" ClientIDMode="Static"/>
                                    <asp:CheckBox ID ="chkRememberMe" runat="server"  Text ="Keep me logged in" /><br />
                                    <asp:Label ID="lblMes" runat="server" Visible="false" ForeColor="Red"/>
                                    <%--<input class="form-control" placeholder="Password" name="password" type="password" value="" />--%>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-lg btn-success btn-block" Text="Login" OnClick="btnLogin_Click" onclientclick="return validateCheck()"/>
                                
                                <%--<button name="btnLogin" class="btn btn-lg btn-success btn-block" onclick="btn_Login">Login</button>--%>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
