
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
                       String pass=request.getParameter("psw");
                       Class.forName("com.mysql.jdbc.Driver");
               
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bill_split","root","");
               
                String sql="select * from user where mobile=? and pass = ? ";
               PreparedStatement ps=con.prepareStatement(sql);
               ps.setString(1,mobno);
               ps.setString(2,pass);
               ResultSet rs=ps.executeQuery();
               if (rs.next())
              {
                            if(rs.getString(5).equals(pass))
                            {
                                HttpSession s = request.getSession(true);
                                
                                s.setAttribute("uid", rs.getString("id"));
                                 response.sendRedirect("creategroup.jsp");
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
