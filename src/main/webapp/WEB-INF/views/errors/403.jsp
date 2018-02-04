
<%-- 
    Document   : 403
    Created on : May 30, 2015, 3:10:48 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            BODY {
                font-family: Tahoma,Arial,sans-serif;
                color: black;
                background-color: white;
            }
            H1 {
                font-family: Tahoma,Arial,sans-serif;
                color: white;
                background-color: #525D76;
                font-size: 22px;
            }
            H3 {
                font-family: Tahoma,Arial,sans-serif;
                color: white;
                background-color: #525D76;
                font-size: 14px;
            }
            P {
                font-family: Tahoma,Arial,sans-serif;
                background: white;
                color: black;
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <h1>HTTP Status ${status} - </h1>
        <hr size="1" noshade="noshade">
        <p><b>type</b> Status report</p>
        <p><b>message</b> <label>${msg}</label></p>
        <p>
            <b>description</b> 
            <u>The requested resource is not available.</u>
        </p>
        <hr size="1" noshade="noshade">
        <h3>Apache Tomcat/7.0.41</h3>
</body>
</html>
