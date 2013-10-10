
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="Db.jsp" %>
<%
if(request.getParameter("action").equals("insertemployee"))
{	
String query="INSERT INTO tbl_employee(`fname`, `departmentid`, `lname`, `contact`, `grade`) VALUES (?,?,?,?,?)";
PreparedStatement preparedStatement = conn.prepareStatement(query);
preparedStatement.setString(1,request.getParameter("fname"));
preparedStatement.setInt(2,Integer.parseInt(request.getParameter("did")));
preparedStatement.setString(3,request.getParameter("lname"));
preparedStatement.setString(4, request.getParameter("phone"));
preparedStatement.setString(5,request.getParameter("grade"));
int status=preparedStatement.executeUpdate();
if(status>=1)
{
	out.print("success");
}
else
{
	out.print("error");
}
}
else if(request.getParameter("action").equals("createteam"))
{
	String teamname = request.getParameter("teamname");
	String query = "INSERT INTO tbl_teams(`teamname`, `timecreation`, `memid`) VALUES(?,?,?)";
	PreparedStatement preparedStatement = conn.prepareStatement(query);
	preparedStatement.setString(1,request.getParameter("teamname"));
	preparedStatement.setString(2, new Date().toString());
	preparedStatement.setString(3,"");
	int status=preparedStatement.executeUpdate();
	if(status>=1)
	{
		out.print("success");
	}
	else
	{
		out.print("error");
	}
}
else if(request.getParameter("action").equals("assignmembers"))
{
	String teamname = request.getParameter("teamname");
	String members = request.getParameter("ids");
  //  String memid[] =   members.split(",");
	String query = "UPDATE tbl_teams SET memid='"+members+"' WHERE teamname='"+teamname+"'";
	Statement st = conn.createStatement();
	int status = st.executeUpdate(query);
	if(status>=1)
	{
		out.print("success");
	}
	else
	{
		out.print("error");
	}
}
%>