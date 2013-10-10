<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

 

<%    //Check for Session
   if(session.getAttribute("userid")==null)
{
     response.sendRedirect("index.jsp?err=2");
}
%>
  
      <%@include file="Db.jsp" %>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Dashboard |  Admin</title>

    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Dashboard | BlueWhale Admin</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
   
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="js/jqPlot/jquery.jqplot.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <!-- END: load jqplot -->
      <link href="css/table/demo_page.css" rel="stylesheet" type="text/css" />
    <!-- BEGIN: load jquery -->
    <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.sortable.min.js" type="text/javascript"></script>
    <script src="js/table/jquery.dataTables.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <script type="text/javascript" src="js/table/table.js"></script>
    <script src="js/setup.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();

            $('.datatable').dataTable();
			setSidebarHeight();


        });
    </script>
    
    <script src="js/setup.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            setupDashboardChart('chart1');
            setupLeftMenu();
			setSidebarHeight();


        });
    </script>

  
<body>
    <div class="container_12">
        <div class="grid_12 header-repeat">
            <div id="branding">
                <div class="floatleft">
                   <font color="white"> <h1>Hexagon Global Demonstration(<em>HR management system</em>)</h1></font></div>
                <div class="floatright">
                    <div class="floatleft">
                        <img src="img/img-profile.jpg" alt="Profile Pic" /></div>
                    <div class="floatleft marginleft10">
                        <ul class="inline-ul floatleft"> <li>
                        <%
                             
                                  Statement st=conn.createStatement();
                                  String query="select * from tbl_admin_login";
                                  ResultSet rs=st.executeQuery(query);
                                  if(rs.next())
                                  {
                                	 out.print("Hello "+rs.getString("email")+"<br />");
                                     out.print("Last Login: "+rs.getString("last_login"));  
                                  }
                                  %>
                                    
                                  </li> 
                                  <li><a href="#">Config</a></li>
                                  <li><a href="Logout.jsp">Logout</a></li>
                              </ul>
                              <br />
                              <span class="small grey">
                        </span>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="grid_12">
            <ul class="nav main">
                <li class="ic-dashboard"><a href="#"><span>Dashboard</span></a> </li>
                <li class="ic-form-style"><a href="javascript:"><span>Controls</span></a>
                    <ul>
                        <li><a href="#">Forms</a> </li>
                        <li><a href="#">Buttons</a> </li>
                        <li><a href="#">Full Page Example</a> </li>
                        <li><a href="#">Page with Sidebar Example</a> </li>
                    </ul>
                </li>
                <li class="ic-typography"><a href="#"><span>Typography</span></a></li>
				<li class="ic-charts"><a href="#"><span>Charts & Graphs</span></a></li>
                <li class="ic-grid-tables"><a href="#"><span>Data Table</span></a></li>
                <li class="ic-gallery dd"><a href="javascript:"><span>Image Galleries</span></a>
               		 <ul>
                        <li><a href="#">Pretty Photo</a> </li>
                        <li><a href="#">Gallery with Filter</a> </li>
                    </ul>
                </li>
                <li class="ic-notifications"><a href="#"><span>Notifications</span></a></li>

            </ul>
        </div>
        <div class="clear">
        </div>
        <div class="grid_2">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                        <li><a class="menuitem">Employee</a>
                            <ul class="submenu">
                               <li><a href="CreateEmployee.jsp">Create an Employee</a> </li>
                                <li><a href="ListEmployee.jsp">Search & list Employee</a> </li>
                                <li><a href="EditEmployee.jsp">Edit an employee deatails</a> </li>
                              
                            </ul>
                        </li>
                        <li><a class="menuitem">Teams</a>
                            <ul class="submenu">
                                <li><a href="CreateTeam.jsp">Create a Team</a> </li>
                                <li><a href="AssignEmployee.jsp">Assign employee to team</a> </li>
                                <li><a href="ListTeams.jsp">List Teams</a> </li>
                                <li><a>Submenu 4</a> </li>
                                <li><a>Submenu 5</a> </li>
                            </ul>
                        </li>
                        <li><a class="menuitem">Projects</a>
                            <ul class="submenu">
                                <li><a href="ListProjects.jsp">List Projects</a> </li>
                                <li><a href="AssignMembers.jsp">Assign members to project</a> </li>
                                <li><a>Submenu 3</a> </li>
                                <li><a>Submenu 4</a> </li>
                                <li><a>Submenu 5</a> </li>
                                <li><a>Submenu 1</a> </li>
                                <li><a>Submenu 2</a> </li>
                                <li><a>Submenu 3</a> </li>
                                <li><a>Submenu 4</a> </li>
                                <li><a>Submenu 5</a> </li>
                            </ul>
                        </li>
                        <li><a class="menuitem">Generate Reports</a>
                            <ul class="submenu">
                                <li><a href="report.jsp">Indivisual Report</a> </li>
                                <li><a>All Students Report</a> </li>
                                <li><a>Customized Report</a> </li>
                              
                    
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>    