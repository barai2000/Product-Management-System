<%@page import="ProductManagementSystem.entities.Product"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int id=Integer.parseInt(request.getParameter("id"));
	
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("venky");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Product p=em.find(Product.class, id);
	et.begin();
	em.remove(p);
	et.commit();
	
	RequestDispatcher rd=request.getRequestDispatcher("ViewProducts.jsp");
	rd.forward(request, response);
	%>
</body>
</html>