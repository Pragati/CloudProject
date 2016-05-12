<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
      <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="starter-template.css" rel="stylesheet">
</head>
<body style="background-color:#000; font-weight:bold">
 <div class="navbar navbar-inverse navbar-fixed-top" style="background-color:#FFC600;">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand">Employee</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">

            <li><a href="offices.jsp">Offices</a></li>
            <li><a href="orders.jsp">Orders</a></li>
            <li><a href="payments.jsp">Payments</a></li>   
          </ul>
        <div class="navbar-form navbar-right">
         <form action="logout.jsp">
         <p style="color:white;"><span class="glyphicon glyphicon-user"></span> Welcome
            <button  class="btn btn-info"><span class="glyphicon glyphicon-log-out"></span> Logout</button> 
          </p>
          </form>  
          </div>
        </div>
      </div>
    </div>
<%
String driver = "com.mysql.jdbc.Driver";
String dburl="jdbc:mysql://nirupama.crudiwrw1ffm.us-west-1.rds.amazonaws.com:3306/classicmodels";
String dbusername = "aws";
String dbpassword = "mysql123";

	

	Connection con=null;
    ResultSet rs=null;
    PreparedStatement ps=null;
    PreparedStatement ps2=null;

    String query="select * from payments where YEAR(paymentDate)=2005;";
	
	Class.forName(driver).newInstance();
	
    con = DriverManager.getConnection(dburl,dbusername,dbpassword);
    ps=con.prepareStatement(query);
	
	rs=ps.executeQuery();

	
%> 
<form method="POST" name="payments.jsp" class="form-horizontal">
<div class="container theme-showcase">
    <div class="page-header">
    <br>
     <h1>Payments</h1>
    </div>
  <table class="table">
      <thead>
          <tr>
              <th>Customer Number</th>
              <th>Check Number</th>
              <th>Payment Date</th>
              <th>Amount</th>
          </tr>   
                  	
      </thead>
      <tbody>
      <% while (rs.next()) {%>
      	<tr>
               <td> <%= rs.getInt(1) %> </td>
               <td> <%= rs.getString(2) %> </td>
               <td> <%= rs.getDate(3) %> </td>
               <td> <%= rs.getDouble(4) %> </td>
           </tr>
         <% } %>
         <% con.close(); %>
      </tbody>
  </table>
  </div>  
</form>    
</body>
</html>	