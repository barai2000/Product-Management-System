<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="css/AddProduct.css">


<%@include file="Header.jsp" %>
</head>
<body>

	<div class="wrapper">
        <h2>Product Details</h2>
        <form action="addProduct" method="post">
            <label>Product ID</label><br>
            <input type="text" name="id" placeholder="Product ID" required><br>
            <label>Product Name</label><br>
            <input type="text" name="name" placeholder="Product Name" required><br>
            <label>Category</label><br>
            <input type="text" name="category" placeholder="Category" required><br>
            <label>Price</label><br>
            <input type="text" name="price" placeholder="Price" required><br>
              <button>Add</button>
        </form>
            
          
    </div>
</body>
</html>