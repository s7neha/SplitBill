
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    
    
    
    <body>
        <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        <%

                 if(request.getParameter("mobno")!=null)
                 {
 
                       String mobno=request.getParameter("mobno");
                       String psw=request.getParameter("psw");
                       Class.forName("com.mysql.jdbc.Driver");
               
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
               
                String sql="select * from split where mobno=? ";
               PreparedStatement ps=con.prepareStatement(sql);
               ps.setString(1,mobno);
               ResultSet rs=ps.executeQuery();
               if (rs.next())
              {
                            if(rs.getString(2).equals(psw))
                            {
                                 response.sendRedirect("creategrp.jsp");
                             }
                             else
                             {
   
                              out.println("invalid Mobile_no or pass");
                                     
                             }
              }
               else
               {
              
                   out.println("invalid username or pass");      
               }
            }
            
       
 %>
  
        
    </body>
</html>
