<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <%@ include file="header.jsp" %>
   <script type=text/javascript>
function showMessage(id)
{
	var fname = document.getElementById('fname').value; 
	var lname = document.getElementById('lname').value; 
	var did = document.getElementById('departmentid').value; 
	var grade = document.getElementById('grade').value; 
	var phone = document.getElementById('phone').value; 
	if(fname=="" || lname=="" || phone=="")
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
    data: "fname="+fname+"&lname="+lname+"&did="+did+"&grade="+grade+"&phone="+phone,
    url: "sample.jsp",
    success: function (msg) {
        // Error occurred in sending request

        if(msg.indexOf('success')!=0)
        	{
        showNotification({
            message: "Employee "+fname+" "+lname+" added Successfully !",
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
                  Start Typing the poject name for suggestions</h2>
                <div class="block">
                <table class="form"> <tr>
                <td><label>Enter the project name</label></td>
            <td>    <input type=text class="mini"></input></td>  </tr>
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
            	out.print("<td><input type=checkbox name="+rs.getInt("eid")+"></td>"); 
            	out.print("<td>"+rs.getString("fname")+"</td>");
            	out.print("<td>"+rs.getString("lname")+"</td>");
            	out.print("<td>"+rs.getString("departmentid")+"</td>");
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
