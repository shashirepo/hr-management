<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@ include file="header.jsp" %>
    <link href="js/notify/jquery_notification.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/notify/jquery_notification_v.1.js"></script>

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
    data: "fname="+fname+"&lname="+lname+"&did="+did+"&grade="+grade+"&phone="+phone+"&action="+'insertemployee',
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add an employee</title>
</head>
<body>
 <div class="grid_10">
            <div class="box round first grid">
 <table class="form"> <tr>
 <td> <label>Add an new employee( Fill in the complete details. )</label> </td>
 
      <tr>
              <td>
                       <label>  First Name:   </label>
             </td>
             <td>
                      <input type=text class=mini name=fname id=fname required=required>
             </td>
      </tr>
       <tr>
              <td>
                       <label>  Last Name:   </label>
             </td>
             <td>
                      <input type=text class=mini name=lname id=lname>
             </td>
      </tr>
                        <tr>
                            <td>
                                <label>
                                    Deapartment</label>
                            </td>
                            <td>
                                <select  name="deopartmentid" id=departmentid>
                                    <option value="1">Information Technology</option>
                                    <option value="2">Banking</option>
                                    <option value="3">Human resource</option>
                                </select>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label>
                                    Grade</label>
                            </td>
                            <td>
                                <select  name="grade" id=grade>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
              <td>
                       <label>  Contact:   </label>
             </td>
             <td>
                      <input type=text class=mini name=phone id=phone>
             </td>
      </tr>
      <tr><td><button class="btn-icon btn-grey btn-plus" onclick="return showMessage(1)"><span></span>Add</button></td></tr>
                        </table>
                        </div></div>
</body>
</html>