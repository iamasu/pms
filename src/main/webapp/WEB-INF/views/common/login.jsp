<%-- 
    Document   : login
    Created on : Apr 1, 2015, 2:03:00 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<%@ page session="true"%>
<fmt:message key="message.password" var="noPass" />
<fmt:message key="message.username" var="noUser" />

<html>
    <head></head>
    <body>
        <c:if test="${param.error != null}">
            <c:choose>
                <c:when
                    test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User is disabled'}">
                    <div class="alert alert-error">
                        <spring:message code="auth.message.disabled"></spring:message>
                        </div>
                </c:when>
                <c:when
                    test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User account has expired'}">
                    <div class="alert alert-error">
                        <spring:message code="auth.message.expired"></spring:message>
                        </div>
                </c:when>
                <c:when
                    test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'blocked'}">
                    <div class="alert alert-error">
                        <spring:message code="auth.message.blocked"></spring:message>
                        </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-error">
                        <!-- <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> -->
                        <spring:message code="message.badCredentials"></spring:message>
                        </div>
                </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test="${param.message != null}">
            <div class="alert alert-info">
                ${param.message}
            </div>
        </c:if>

        <div class="container">
            <div class="span12">
                <h1><spring:message code="label.form.loginTitle"/></h1>
                <!--<a href="?lang=en"><spring:message code="label.form.loginEnglish"/></a> |--> 
                <!--<a href="?lang=es_ES"><spring:message code="label.form.loginSpanish"/></a>-->
                <form name='f' action="/login.htm" method='POST'>
                    <table>
                        <tr>
                            <td><label><spring:message code="label.form.loginEmail"/></label></td>
                            <td><input type='text' name='j_username' value=''></td>
                        </tr>
                        <tr>
                            <td><label><spring:message code="label.form.loginPass"/></label></td>
                            <td><input type='password' name='j_password' /></td>
                        </tr>
                        <tr>
                            <td>Remember Me: </td>
                            <td><input type="checkbox" name="_spring_security_remember_me" /></td>
                        </tr>
                        <tr>
                            <td>
                                <input class="btn btn-primary" name="submit" type="submit"value=<spring:message code="label.form.submit"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>