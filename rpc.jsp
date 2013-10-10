<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Db.jsp"%>
<%
String query = "SELECT * FROM tbl_teams WHERE teamname LIKE '%"+request.getParameter("query")+"%'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
out.print("[");
int i=0;
while(rs.next())
{
	if(i==0)
	out.print("[\""+rs.getString("teamname")+"\"]");
	else
	out.print(",[\""+rs.getString("teamname")+"\"]");
	   i++;
}
out.print("]");
%>
