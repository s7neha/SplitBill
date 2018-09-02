<%-- 
    Document   : home
    Created on : Aug 7, 2018, 1:41:10 PM
    Author     : Shubham Chandrakar
--%>

<%@page import="com.sun.corba.se.spi.presentation.rmi.StubAdapter.request(Object, String, boolean)"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Select User</h1>
<!--        <form action="" method="get">
            <select name="user">
            
  <option value="volvo">1</option>
  <option value="saab">2</option>
  <option value="mercedes">3</option>
  <option value="audi">4</option>
</select>
            <input type="submit" value="Submit" name="submit">
        </form>-->
        <br>
        <br>
        <%! int count =request.getAttribute("uid"); %>
        
        <table border="1">
            <tr>
                <td> Name</td>
                <td> Amount Due</td>
            </tr>
            
        <%
         out.println("This java code");
         
         Connection con = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bill_split", "root", "");


         String sql = "select * from split_exp where receiver_id = 1";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
                    %>
                    
                        <tr>
                                <td><%
                                    String sql1 = "select name from user where id= ?";
                                    PreparedStatement st1 = con.prepareStatement(sql1);
                                    int i = 1;
                                    st1.setString(i++, rs.getString("payer_id"));
                                    ResultSet rs1 = st1.executeQuery();
                                    while(rs1.next()){
                                        out.println(rs1.getString("name"));
                                        
//rs1.getString("name");
                                    }
                                    
                                    %></td>
                                
                                <td><%=rs.getString("amt") %></td>
                                <td><a href="payment.jsp">Pay</a>></td>
                                
                            </tr>
			
       <%
                }
      %>
      </table>
        
        
    </center>
        
    </body>
</html>
