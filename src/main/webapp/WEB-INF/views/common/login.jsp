<%-- 
    Document   : login
    Created on : Dec 28, 2015, 2:28:46 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form name="user" id="user" action="" method="POST">
            <input type="text" name="username" id="username"/>
            <input type="password" name="password" id="password"/>
            <input type="submit" value="Login"/>
            <span>${error}</span>
        </form>
    </body>
</html>
