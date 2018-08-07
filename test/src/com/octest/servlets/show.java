package com.octest.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Show")
public class show extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public show() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    static Connection conn1 ;
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//String table  = request.getParameter("q");
		String database  = request.getParameter("p");
		response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
		try {
			Class.forName("org.postgresql.Driver");
			
			String url = "jdbc:postgresql://localhost/"+database;
		    String user = "postgres";
		    String passwd = "123456";

		    conn1 = DriverManager.getConnection(url, user, passwd);
		 		    
		    response.getWriter().write("Connexion effective !");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
