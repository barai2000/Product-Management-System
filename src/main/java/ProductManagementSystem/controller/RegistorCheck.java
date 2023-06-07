package ProductManagementSystem.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProductManagementSystem.entities.LoginInfo;
import ProductManagementSystem.entities.Product;

@WebServlet("/resistor")
public class RegistorCheck extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String password=req.getParameter("password");
		String cno=req.getParameter("cno");
		String address=req.getParameter("address");
		
		
		LoginInfo li=new LoginInfo();
		li.setName(name);
		li.setPassword(password);
		li.setCno(Long.parseLong(cno));
		li.setAddress(address);
		
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("venky");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(li);
		et.commit();
		
		RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
		rd.forward(req, resp);
	}
}
