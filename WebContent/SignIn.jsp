<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="edu.neu.cs5200.hotel.main.service.*, java.text.*,java.util.*"%>

<html lang="en">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Signin Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<%
	String signIn= request.getParameter("action");
	String IfCustomer= request.getParameter("userType");
  	String Username = request.getParameter("Username");
  	String password = request.getParameter("password");
  	String userTpye = request.getParameter("userType");
  	UserManagementService userManagementService = new UserManagementService();
  	Boolean ifExistCustomer  = userManagementService.verifyCustomer(Username,password);
  	Boolean ifExistHoteluser  = userManagementService.verifyHoteluser(Username,password);
//   	if(email != null && password != null) {
//   		ifExist = userManagementService.verifyUser(email, password);
//   	}
	if("Customer".equals(IfCustomer))
	{
		if("signIn".equals(signIn))
		{
  			if(ifExistCustomer) 
  			{
  	  		RequestDispatcher dispatcher = request.getRequestDispatcher("/HotelList.jsp");
  	  		dispatcher.forward(request, response);
  			}
		}
	}
	if("HotelUser".equals(IfCustomer))
	{
		if("signIn".equals(signIn))
		{
  			if(ifExistHoteluser) 
  			{
  	  		RequestDispatcher dispatcher = request.getRequestDispatcher("/createHotel.jsp");
  	  		dispatcher.forward(request, response);
  			}
		}
	}
//   	else if(ifExist) {
//   	  	RequestDispatcher dispatcher = request.getRequestDispatcher("/HotelList.jsp");
//   	  	dispatcher.forward(request, response);
//   	}
  %>

	<div class="container">

		<form class="form-signin">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputUsername" class="sr-only">Username</label> <input
				name="Username" type="Username" id="inputUsername" class="form-control"
				placeholder="Username" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				name="password" type="password" id="inputPassword"
				class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label class="radio-inline"> <input type="radio"
					name="userType" id="inlineRadio1" value="HotelUser"> Hotel
					User
				</label> <label class="radio-inline"> <input type="radio"
					name="userType" id="inlineRadio2" value="Customer">
					Customer
				</label> 
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="signIn">Sign
				in</button>
		</form>
		<a href="signUp.jsp"><button type="button" 
					class="btn btn-link">sign up</button></a>
	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
