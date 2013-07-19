<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>(website:39)

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
        .content{  margin:50px auto; text-align:center; width:622px; }

#txtUsername { padding:10px; border:solid 1px #cccccc; width:300px;

color:#555555;  font: 18pt tahoma; float:left;}

#lblAvailable { padding:11px; margin:0 10px; border:solid 1px #cccccc;
                background-color:#ffff00; width:200px; color:#555555;
                font: 18pt tahoma; float:right; display:none; }
#img { float:left; cursor:pointer; }
    </style>
    
    <script src="jquery-1.6.2.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
            $('#img').hide();
            $('#img1').hide();
            $('#txtUsername').blur(function() {
                $('#lblAvailable').show();
                //if there is on text
                if ($('#txtUsername').val().length == 0) {
                    $('#lblAvailable').html("Type Uasername");
                    $('#lblAvailable').css("background-color", "#ffff00");
                }
                else {
                    $('#lblAvailable').html("Checking,,");
                    $.ajax({ type: "POST",
                        url: "WebService.asmx/getAvailability", //web service and funtion name
                        data: "{Username:'" + $('#txtUsername').val() + "'}", // passing parameter
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(response) {
                            var result = response.d;
                            $('#lblAvailable').html(result);
                            if (result == "Available") {
                                $('#lblAvailable').css("background-color", "#00db00");
                                $('#img').show();
                                $('#img1').hide();
                            }
                            else {
                                $('#lblAvailable').css("background-color", "#ff0000");
                                $('#img1').show();
                                $('#img').hide();
                            }
                        },
                        error: function(msg) {
                            $('#lblAvailable').html("Try again");
                        }
                    });
                }
            });
        });
</script>
</head>
<body>
    <form id="form1" runat="server">
  
  <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Checking user name availability with jquery Ajax  </b> 
    <div class="content"> 
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox> 
        <img src="yes.jpg" id="img" alt="Check" title="Check Availability" />
        <img src="no.jpg" id="img1" alt="Check" title="Check Availability" />
        <p id="lblAvailable">Type Uasername</p>
            </div> 
    </form>
    <p>

    </p>
</body>
</html>

