<%-- 
    Document   : invalidSession
    Created on : Apr 1, 2015, 2:02:36 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
    <head>
        <link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
        <title><spring:message code="label.pages.home.title"></spring:message></title>
        </head>
        <body>
            <div class="container">
                <div class="span12">
                    <h1 class="alert alert-error">
                    <spring:message code="message.sessionExpired"/>
                </h1>
                <a href="<c:url value="/login.htm" />"><spring:message code="label.form.loginLink"/></a>
            </div>
        </div>
    </body>

</html>
