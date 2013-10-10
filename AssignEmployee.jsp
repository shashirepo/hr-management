<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

   <%@ include file="header.jsp" %>
    <link href="js/notify/jquery_notification.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/notify/jquery_notification_v.1.js"></script>
<script src="http://yui.yahooapis.com/3.4.1/build/yui/yui-min.js"></script>
<script type="text/javascript">
YUI().use('autocomplete', 'autocomplete-highlighters', function(Y){
    //autocomplete is available and ready to use    
 
    //add yui skin to class body so that the default 
    //auto complete widget skin will be applied:
    Y.one('body').addClass('yui3-skin-sam');
    Y.one('#teamname').plug(Y.Plugin.AutoComplete, {
        resultHighlighter: "phraseMatch",
        source: "rpc.jsp?query={query}"
    });
 
});
</script>
<script type=text/javascript>
function showMessage(id)
{
	var teamname = document.getElementById('teamname').value; 
	var ids = [];
	$('.ids:checked').each(function(i, e) {
	    ids.push($(this).val());
	});

	if(teamname=='' || ids=='')
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
    url: "sample.jsp?teamname="+teamname+"&ids="+ids+"&action="+'assignmembers',
    success: function (msg) {
        // Error occurred in sending request

        if(msg.indexOf('success')!=0)
        	{
        showNotification({
            message: "Team "+teamname+" Updated Successfully !",
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
                <table class="data display datatable" id="example">
				<thead>
					<tr>
					    <th>Select Employee</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Department</th>
						<th>Contact</th>
						<th>CSS grade</th>
					</tr>
				</thead>     
              
				<tbody>
             <%
              st=conn.createStatement();
              query="select * from tbl_employee";
              rs=st.executeQuery(query);
              int i=0;
             while(rs.next()) {
            	i+=1;
            	 if(i%2==0)
            	out.print("<tr class=\"odd gradeX\">");
            	 else
                out.print("<tr class=\"even gradeC\">");
            	out.print("<td><input type=checkbox value="+rs.getInt("eid")+" class=\"ids\" name=ids[]></td>"); 
            	out.print("<td>"+rs.getString("fname")+"</td>");
            	out.print("<td>"+rs.getString("lname")+"</td>");
            	Statement st1 = conn.createStatement();
           	    String query1 = "select dname from tbl_department where did="+rs.getInt("departmentid");
           	    ResultSet rs1 = st1.executeQuery(query1);
           	    if(rs1.next())
           	    out.print("<td>"+rs1.getString("dname")+"</td>");
            	out.print("<td>"+rs.getString("contact")+"</td>");
            	out.print("<td>"+rs.getString("grade")+"</td></tr>");
            	
             
             }
             %>
            
            
					
						
					</tbody>
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
