<%-- 
    Document   : creategroup
    Created on : Aug 7, 2018, 3:07:19 PM
    Author     : Shubham Chandrakar
--%>





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
       
        
            
                <center> <h1>Create Group</h1></center>
                
            
            
        <center> 
         <form action="reg_grp_servelet" method="post">
                    <label> Group ID</label>
                    <input type="text" name="gid" placeholder="group ID">
                     <label> User ID</label>
                     <input type="text" name="uid" placeholder="User ID">
                      <label> Temporary Group </label>
                      <input type="radio" name="status" value="0">
                      <label>Permanent Group</label>
                      <input type="radio" name="status" value="1">
                     
                
             <input type="Submit" value="Submit">
        </form>
            </center> 
                <br><br>
                
               <center> 
                   <a href="split_bill.jsp"> Split Your Bill</a><br>
                   <br>
<table border="1">
            <tr>
                <td> Name</td>
                <td> Receiving Amount </td>
            </tr>
            
        <%
         out.println("Amount to be received");
         
         Connection con = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bill_split", "root", "");
              String uid = (String) session.getAttribute("user");
          
         String sql = "select * from split_exp where receiver_id = "+uid+"";
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
                                
                                
                            </tr>
			
       <%
                }
      %>
      </table>
      
      <br><br>
      <table border="1">
            <tr>
                <td> Name</td>
                <td> Due Amount </td>
            </tr>
            
        <%
         out.println("Amount to be Paid");
         
         Connection con1 = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bill_split", "root", "");
              String uid1 = (String) session.getAttribute("user");
          
         String sql1 = "select * from split_exp where payer_id = "+uid1+"";
		PreparedStatement st1 = con.prepareStatement(sql1);
		ResultSet rs1= st1.executeQuery();
		while(rs1.next()){
                    %>
                    
                        <tr>
                                <td><%
                                    String sql2 = "select name from user where id = ?";
                                    PreparedStatement st2 = con1.prepareStatement(sql2);
                                    int i = 1;
                                    st2.setString(i++, rs1.getString("receiver_id"));
                                    ResultSet rs2 = st2.executeQuery();
                                    while(rs2.next()){
                                        out.println(rs2.getString("name"));
                                        
//rs1.getString("name");
                                    }
                                    
                                    %></td>
                                
                                <td><%=rs1.getString("amt") %></td>
                                
                                
                            </tr>
			
       <%
                }
      %>
      </table>
      </center>>
                
                
    </body>
</html> 
