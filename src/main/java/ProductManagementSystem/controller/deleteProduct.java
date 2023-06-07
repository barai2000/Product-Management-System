package ProductManagementSystem.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProductManagementSystem.entities.Product;

public class deleteProduct extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("venky");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Product p=em.find(Product.class, id);
		et.begin();
		em.remove(p);
		et.commit();
		
		RequestDispatcher rd=req.getRequestDispatcher("ViewProducts.jsp");
		rd.forward(req, resp);
		
		
		
	}

}
