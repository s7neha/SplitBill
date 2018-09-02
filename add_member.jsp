


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
          
              <div >
                <center> <h1>Create Group</h1></center>
           
            </div>
    <% 
        if (session != null) {
			if (session.getAttribute("user") != null) {
				String gid = (String) session.getAttribute("user");
                                
                        }
        }
    
    %>
    <center>
        <form action="reg_grp_servelet" method="post">
              
                 
                    <label>Group ID</label>
                    
                    <input type="text" name="gid" value="<%= (String) session.getAttribute("user")%>" disabled><br><br>
                     <label> User ID</label>
                     <input type="text" name="uid"><br><br>
                     
             <input type="submit" value="ADD MEMBER" name="add">    
             
              
             
        </form><br><br>
        <table border="1">
            <tr>
                <td> Name</td>
                <td> Group id</td>
            </tr>
            
        <%
         
         
         Connection con = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bill_split", "root", "");

            String gid = (String) session.getAttribute("user");
         
                
                
                
                String sql6 = "select * from groups where gid = ?";
		PreparedStatement st6 = con.prepareStatement(sql6);
		int i6 = 1;
		st6.setString(i6++, gid);
		ResultSet rs = st6.executeQuery();
		while(rs.next()){
		    %>
                    
                        <tr>
                                <td><%
                                    String sql1 = "select name from user where id= ?";
                                    PreparedStatement st1 = con.prepareStatement(sql1);
                                    int i = 1;
                                    st1.setString(i++, rs.getString("uid"));
                                    ResultSet rs1 = st1.executeQuery();
                                    while(rs1.next()){
                                        out.println(rs1.getString("name"));
                                        
//rs1.getString("name");
                                    }
                                    
                                    %></td>
                                
                                <td><%=rs.getString("gid") %></td>
                                
                                
                            </tr>
			
       <%
                }
      %>
      </table>
            </center>         
    
</html>
