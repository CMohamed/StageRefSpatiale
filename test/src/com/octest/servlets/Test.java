package com.octest.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    static Connection conn ;
  
    
    private ArrayList<String> listDownAllDatabases() {
    	ArrayList<String> DB = new ArrayList<>();
    	try {
            PreparedStatement ps = conn
                    .prepareStatement("SELECT datname FROM pg_database WHERE datistemplate = false;");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                System.out.println(rs.getString(1));
                DB.add(rs.getString(1));
            }
            rs.close();
            ps.close();
            return DB;

        } catch (Exception e) {
            e.printStackTrace();
        }
    	return DB ;
    }
    private ArrayList<String> listDownAllTables(String DB) {
    	ArrayList<String> Tables = new ArrayList<>();
    	try {
    		String url = "jdbc:postgresql://localhost/"+DB;
		    String user = "postgres";
		    String passwd = "123456";

		    conn = DriverManager.getConnection(url, user, passwd);
            PreparedStatement ps = conn
                    .prepareStatement("SELECT TABLE_NAME from information_schema.tables where table_schema='public';");
            
            ResultSet rs = ps.executeQuery();
            //System.out.println(rs);
            while (rs.next()) {
                System.out.println(rs.getString(1));
                Tables.add(rs.getString(1));
            }
            rs.close();
            ps.close();
            return Tables;

        } catch (Exception e) {
            e.printStackTrace();
        }
    	return Tables ;
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String db  = request.getParameter("DB");
		String requestType  = request.getParameter("RequestType");
		
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("org.postgresql.Driver");
			
			
			String url = "jdbc:postgresql://localhost/?";
		    String user = "postgres";
		    String passwd = "123456";

		    conn = DriverManager.getConnection(url, user, passwd);
		    out.println("Connexion effective !");
		    
		    ArrayList<String> DBs =  listDownAllDatabases();
		    
		    
			request.setAttribute( "DBs", DBs );
			
			ArrayList<String> tables=new ArrayList<>();
			boolean wach9lbti = false;
			if(db!=null && requestType!=null) {
				tables = listDownAllTables(db);
				wach9lbti = true;
				if (requestType.equals("Spatiale")) {
					
				}
				else {
					
				}
			}
			System.out.println(requestType);
			request.setAttribute("requestType", requestType);
			request.setAttribute("tables", tables);
			request.setAttribute("wach9lbti", wach9lbti);
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/view.jsp").forward(request, response);
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
