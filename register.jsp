<%-- 
    Document   : register
    Created on : 19 Jul, 2018, 3:10:10 PM
    Author     : user pc
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
       
    </head>
    <body>
         <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        
        <%
        
            
            String mob=request.getParameter("mobno");
            String pass=request.getParameter("psw");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            
           
            
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bill_split","root","");
                
                
                 String sql = "insert into user " +
				" (name, mobile,email, pass) " +
				" values (?, ?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		int i = 1;
                st.setString(i++, name);
                st.setString(i++, mob);
                st.setString(i++, email);
                st.setString(i++, pass);
                st.executeUpdate();
                
                
            
       out.println(" Registered successfully!");
       response.sendRedirect("index.html");
        %>
    </body>
</html>
