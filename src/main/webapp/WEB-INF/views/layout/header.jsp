<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set value="${sessionScope['_user_cpse_']}" var="user"/>
<table border='0' width='100%' style="background: #11202D;border: 0px;">
    <tr  valign="top" >
        <td width='100%'>
            <div style="float: left;color: #FFFFFF;line-height: 0.2em;padding: 5px;">
                <img src="/images/favicon.png" height="50"/>
                <span style="padding-left: 10px;padding-top: 40px;float: right;">${user.companyName}</span>
            </div>
            <div style="float: right;padding-right: 10%;text-decoration: none;">
                <a  href="/airlinemaster.htm" style="padding-right: 5px;">Airline</a> 
                <a  href="/cpsemaster.htm" style="padding-right: 5px;">CPSE</a> 
                <a  href="/register/digitalcert.htm" style="padding-right: 5px;">Digital Certificate</a>
                <a  href="/home.htm" style="padding-right: 5px;">Home</a> 
                <a  href="/logoff.htm" style="float: right;" >Logoff</a>
            </div>
        </td>
    </tr>
</table>