   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    <%@include file="header.jsp" %>

<body>
 <div class="grid_10">
            <div class="box round first">
                <h2>Create A Quiz</h2>
                
                <div class="block">
             <div class="block ">
                    <form>
                    <table class="form">
                       
                        <tr>
                            <td>
                                <label>
                                Quiz Name</label>
                            </td>
                            <td>
                                <input type="text" class="quiz_name" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Select Course Type</label>
                            </td>
                            <td>
                                <select id="select" name="course_type">
                                    <option value="0"><--Select Course Type--></option>
                                    <option value="1">java</option>
                                    <option value="2">Lniux</option>
                                    <option value="3">C++</option>
                                </select>
                            </td>
                        </tr>
                         <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    IntroDuction About Quiz</label>
                            </td>
                            <td>
                                <textarea class="tinymce"></textarea>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <label>
                                    Grade Method</label>
                            </td>
                            <td>
                                <input type="radio" name="marks" />
                                Marks
                                <input type="radio" name="grade" />
                                Grade
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <label>
                                    Dialog Box</label>
                            </td>
                            <td>
                                <div id="dialog" title="Basic dialog">
                                    <p>
                                        This is an animated dialog which is useful for displaying information. The dialog
                                        window can be moved, resized and closed with the 'x' icon.</p>
                                </div>
                                <button id="opener">
                                    Open Dialog</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Start Date</label>
                            </td>
                            <td>
                                <input type="text" id="date-picker" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    End Date</label>
                            </td>
                            <td>
                                <input type="text" id="date-picker" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Attempts Allowed</label>
                            </td>
                            <td>
                                <select id="select" name="course_type">
                                    <option value="0"><--Select Attempts--></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="many">Unlimited</option>
                                </select>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label>
                                    Shuffle Questions</label>
                            </td>
                            <td>
                                <input type="checkbox"  name="isShuffle" value=1/>Yes
                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Import CSV/text</label>
                            </td>
                            <td>
                                <input type="file" />
                            </td>
                        </tr>
                      
                        <tr>
                        <td>	<button class="btn btn-large">Add Quiz</button>
                        </td></tr>
                    </table>
                    
                    </form>
                </div>
</body>
</html>