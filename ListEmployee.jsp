<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <%@ include file="header.jsp" %>
   </head>
   
   <body>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>
                  Create & List Employee</h2>
                <div class="block">
                <table class="data display datatable" id="example">
				<thead>
					<tr>
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
