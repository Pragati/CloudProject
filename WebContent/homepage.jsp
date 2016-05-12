
<!DOCTYPE html>
<html lang="en">
  <head>
      <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="starter-template.css" rel="stylesheet">
      <link href="css/style2.css" rel='stylesheet' type='text/css' />
</head>
<body style="background-color:#000">
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
    
   <div>
      <div class="homepage-form">
       <h3>Hello, <%= session.getAttribute("user") %></h3>
      </div>
</div>
</body>
</html>
