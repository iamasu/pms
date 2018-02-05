<%-- 
    Document   : usermaster
    Created on : Jan 20, 2016, 1:09:11 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <div class="div div-grid">
            <div class="div-heading"><h3 class="div-title">User Details</h3></div>
            <sf:form commandName="userMaster" enctype="multipart/form-data">
                <div class="div-body">
                    <table>
                        <tr>
                            <th>First Name</th><td><sf:input path="firstName"/></td>
                            <th>Last Name</th><td><sf:input path="lastName"/></td>
                        </tr>
                        <tr>
                            <th>Register Your Digital Certificate</th><td colspan="3"><input type="file" name="file" id="file"/></td>
                        </tr>
                    </table>
                </div>
                <div class="div-footer">
                    <input type="submit" value="Submit"/>
                </div>
            </sf:form>
        </div>
    </body>
</html>
