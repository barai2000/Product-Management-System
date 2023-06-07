<%@page import="javax.persistence.Query"%>

<%@page import="ProductManagementSystem.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ProductManagementSystem.entities.LoginInfo"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View product</title>

<%@include file="Header.jsp" %>
<link rel="stylesheet" href="css/ViewProduct.css">
</head>
<body>

	
			<table align="center" class="wrapper" id="forminput">
			<center><h2 class="heading">Product Details</h2></center>
			
				<tr>
				
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>Price</th>
				<th colspan="2">Actions</th>
				</tr>
	<%
	
	
			//int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
	
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("venky");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			Query q=em.createQuery("select a from Product a "); //Fetch particular object
			List<Product> p=q.getResultList();
			
			
			/* LoginInfo li=em.find(LoginInfo.class, name);
			
			List<Product> p=li.getProduct(); */
			
			
			for(Product p1:p)
			{
				%>
						
								
								<tr align="center">
								<td><%=p1.getId() %></td>
								<td><%=p1.getName() %></td>
								<td><%=p1.getCategory() %></td>
								<td><%=p1.getPrice()%></td>
								<td><button><a href="editProduct.jsp?id=<%=p1.getId() %>">Edit</a></button></td>
								<td><button><a href="deleteProduct.jsp?id=<%=p1.getId() %>">Delete</a></button></td>

									</tr>	
				<% 
			}
	%>
		
		</table>
		
		
		
</body>
</html>