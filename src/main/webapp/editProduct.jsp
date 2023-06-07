<%@page import="javax.persistence.Query"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" href="css/UpdateProduct.css">
<%@include file="Header.jsp" %>
</head>
<body>
	 
    
    <%
	String id=request.getParameter("id");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","Venky@2000");
	PreparedStatement ps=con.prepareStatement("select * from productmanagement.Product where id='"+id+"'");
	ResultSet rs=ps.executeQuery();
	
	while(rs.next()) 
	{
		%>
			<div class="wrapper">
	    					 <h1>Update Details</h1>
				        <form action="updateProduct" method="post">
				            <label>Product ID</label><br>
				            <input type="text" name="id" placeholder="Product ID" value="<%=rs.getString(1) %>" required><br>
				            <label>Product Name</label><br>
				            <input type="text" name="name" placeholder="Product Name" value="<%=rs.getString(2) %>" required><br>
				            <label>Category</label><br>
				            <input type="text" name="category" placeholder="Category" value="<%=rs.getString(3)%>" required><br>
				            <label>Price</label><br>
				            <input type="text" name="price" placeholder="Price" value="<%=rs.getString(4) %>" required><br>
							 <button>Save</button>       
				        </form>
		<%	
	}
	%>
	
    </div>
    
    
    
    
    
    
    
    
    
</body>
</html>