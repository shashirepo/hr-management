<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <%@ include file="header.jsp" %>
    <link href="js/notify/jquery_notification.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/notify/jquery_notification_v.1.js"></script>
   <script type=text/javascript>
function showMessage(id)
{
	var teamname = document.getElementById('teamname').value; 

	if(teamname=='')
		{
		
		showNotification({
            type : "warning",
            message: "Warning ! Please fill out all those fields !",
            autoClose: true, // auto close to true
            duration: 5 // display duration
    });
		
		}
	else
		{
$.ajax({
    type: "POST",
    data: $('.ids:checked').serialize(),
    url: "sample.jsp?teamname="+teamname+"&action="+'createteam',
    success: function (msg) {
        // Error occurred in sending request

        if(msg.indexOf('success')!=0)
        	{
        showNotification({
            message: "Team "+teamname+" added Successfully !",
            type: "success", // type of notification is error
            autoClose: true, // auto close to true
            duration: 5 // display duration
        });
       }
        else
        	{
        	showNotification({
        		message: "Oops! an error occurred.",
                type: "error", // type of notification is error
                autoClose: true, // auto close to true
                duration: 5 // display duration
            });
        	}
    }
});
}}
</script>
   
   </head>
   
   <body>
   
        <div class="grid_10">
            <div class="box round first grid">
                <h2>
                  Create a Team</h2>
                <div class="block">
                <table class="form"> <tr>
                <td><label>Enter The Team Name</label></td>
            <td>    <input type=text class="mini" name="teamname" id="teamname"></input></td>  </tr>
              <tr><td><button class="btn-icon btn-grey btn-plus" onclick="return showMessage(1)"><span></span>Add</button></td></tr>
                        </table>
               
                    
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="site_info">
        <p>
            Copyright <a href="#">BlueWhale Admin</a>. All Rights Reserved.
        </p>
    </div>
</body>
</html>
