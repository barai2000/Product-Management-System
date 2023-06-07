<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
		 <div class="wrapper">
			<%@include file="message.jsp" %>
        <h1>Login</h1>
        <form action="processLogin" method="post">
       
            <input type="text" name="name" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
        
        	  <div class="terms">
                <input type="checkbox" id="checkbox" value="checked" name="condition">
                <label for="checkbox">I agree to these
                <a href="">Terms & Conditions</a></label>
            </div>
            <button><b>Login</b></button>
        </form>
          
    </div>
</body>
</html>