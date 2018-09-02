<%-- 
    Document   : split_bill
    Created on : Aug 7, 2018, 4:05:05 PM
    Author     : Shubham Chandrakar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <form action="split_exp_servelet" method="get">
            
            Paid amount by me: <input type="text" name="paid_amt"><br>
            My id: <input type="text" name="uid"><br>
            Group id <input type="text" name="gid"><br>
            <input type="submit" value="Submit" name="submit">
            
        </form>
        
        
    </center>
    </body>
</html>
