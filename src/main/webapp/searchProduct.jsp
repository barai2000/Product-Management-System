<%@page import="ProductManagementSystem.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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
<title>Search Product</title>


<%@include file="Header.jsp" %>
<link rel="stylesheet" href="css/SearchProduct.css">
</head>
<body>
			
			 <div class="wrapper">
        <h2>Search ID</h2>
        <form action="searchProduct.jsp" method="post">
            <label>Product ID</label><br>
            <input type="text" name="id" placeholder="Product ID" required><br>
           
			 <button>Search</button>       
        </form>
            
    </div>
    <table align="center" class="wrapper" padding="5px">
		<center><h1>Product Details</h1></center>
			<tr>
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Category</th>
			<th>Price</th>
			<th colspan="2">Actions</th>
		</tr>
		<%
			String id=request.getParameter("id");
			if(id!=null)
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","Venky@2000");
				PreparedStatement ps=con.prepareStatement("select * from productmanagement.Product where id='"+id+"'");
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) 
				{
					%>
						<tr align="center">
								<td><%=rs.getString(1) %></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(4)%></td>
								<td><button><a href="editProduct.jsp?id=<%=rs.getString("id") %>">Edit</a></button></td>
								<td><button><a href="deleteProduct.jsp?id=<%=rs.getString("id") %>">Delete</a></button></td>

									</tr>	
					<%	
				}
				
					
			}
			else
			{		%>
						<tr>
				 		<td colspan="5">No record to display</td>
				 	</tr>
					<%
						
		 	
			}
			
		
		%>
		
		
	</table>
			
			
			
			
</body>
</html>