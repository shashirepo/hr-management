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
						<th>Team Name</th>
						<th>Created</th>
						<th>Members</th>	
						
					</tr>
				</thead>     
              
				<tbody>
             <%
              st=conn.createStatement();
              query="select * from tbl_teams";
            
              rs=st.executeQuery(query);
              int i=0;
             while(rs.next()) {
            	i+=1;
            	 if(i%2==0)
            	out.print("<tr class=\"odd gradeX\">");
            	 else
                out.print("<tr class=\"even gradeC\">");	 
            	out.print("<td>"+rs.getString("teamname")+"</td>");
            	out.print("<td>"+rs.getString("timecreation")+"</td>");
            	Statement st1 = conn.createStatement();
            	String members = rs.getString("memid");
            	String memid[] =   members.split(",");
           	    out.print("<td>");
           	    if(!members.equals(""))
           	    { 	
            	for(int j=0;j<memid.length;j++) {
            		String query1 = "select fname,lname from tbl_employee where eid="+memid[j];
               	    ResultSet rs1 = st1.executeQuery(query1);
            	 if(rs1.next())
            		 if(memid.length>1)
            	out.print(rs1.getString("fname")+" "+rs1.getString("lname")+", ");
            		 else
            	out.print(rs1.getString("fname")+" "+rs1.getString("lname"));		 
            	}
           	    }
            	else
           	    {
           	    	out.print("NIL");
           	    }
            	out.print("</td></tr>");
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
