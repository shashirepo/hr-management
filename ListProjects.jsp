<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <%@ include file="header.jsp" %>
   </head>
   
   <body>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>
                  Project List</h2>
                <div class="block">
                <table class="data display datatable" id="example">
				<thead>
					<tr>
						<th>Project Name</th>
						<th>Project Info</th>
						<th>Time Released</th>
						<th>Project code</th>
					</tr>
				</thead>     
              
				<tbody>
             <%
              st=conn.createStatement();
              query="select * from tbl_projects";
              rs=st.executeQuery(query);
              int i=0;
             while(rs.next()) {
            	i+=1;
            	 if(i%2==0)
            	out.print("<tr class=\"odd gradeX\">");
            	 else
                out.print("<tr class=\"even gradeC\">");	 
            	out.print("<td>"+rs.getString("pname")+"</td>");
            	out.print("<td>"+rs.getString("pinfo")+"</td>");
            	out.print("<td>"+rs.getString("timereleased")+"</td>");
            	out.print("<td>"+rs.getString("pid")+"</td></tr>");
            	
             
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
