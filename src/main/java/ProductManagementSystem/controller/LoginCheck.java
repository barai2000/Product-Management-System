package ProductManagementSystem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProductManagementSystem.entities.LoginInfo;
import ProductManagementSystem.entities.Product;

@WebServlet("/processLogin")
public class LoginCheck extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String password=req.getParameter("password");
		String condition=req.getParameter("condition");
		
		if(condition!=null)
		{
			if(condition.equals("checked"))
			{
					
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("venky");
				EntityManager em=emf.createEntityManager();
				EntityTransaction et=em.getTransaction();
				
				Query q=em.createQuery("select a from LoginInfo a where a.name=?1 and a.password=?2");
				q.setParameter(1, name);
				q.setParameter(2, password);
				
				List<LoginInfo> li=q.getResultList();
				if(li.size()>0)
				{
					LoginInfo li1=li.get(0); //LoginInfoObject
					HttpSession hs=req.getSession(); //create session
					
					hs.setAttribute("li", li1); //set logininfo object
					
					RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
					rd.forward(req, resp);
					
				}
				else
				{
//					PrintWriter pw=resp.getWriter();
//					pw.write("Invalid Credentials !");
					
					HttpSession hs=req.getSession();
					hs.setAttribute("message", "Invalid Credentials !");
					
					RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
					rd.include(req, resp);
					resp.setContentType("text/html");
				}
				
			
				
			}
		}
		else
		{
			/*
			 * PrintWriter pw=resp.getWriter();
			 * pw.write("You have not accepted terms and conditions.");
			 */
			
			HttpSession hs=req.getSession();
			hs.setAttribute("message", "You have not accepted terms and conditions !");
			
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
			resp.setContentType("text/html");
		}
		
		
	}
}
