<%-- 
    Document   : create
    Created on : Aug 7, 2018, 11:16:02 AM
    Author     : NEHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sign up</title>
    </head>
    <body>
        <br><br><center>
            <h1>Sign Up</h1>
            <form action="register.jsp" method="POST">
   
<label for="number"><b>Name:</b></label>
    <input type="text" placeholder="Name" name="name"  ><br><br>
<label for="number"><b>Email</b></label>
    <input type="email" placeholder="Email" name="email"  ><br><br>

    <label for="number"><b>Mobile No:</b></label>
    <input type="text" placeholder="Mobile no" id="phone" name="mobno"  minlength="10" maxlength="10" ><br><br>

    <label for="psw"><b>Password:</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="pass1"  required> <br><br>
    <input type="submit" name="submit">
    </form>
    </center>
    </body>
</html>
