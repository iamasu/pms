<%-- 
    Document   : inputDate
    Created on : Mar 11, 2010, 10:16:13 AM
    Author     : nlcadmin
--%>

<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@tag description="Date Input field with date picker, as to be within of spring form tag block" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="path" required="true"%>
<%@attribute name="onclick" required="false"%>
<%@attribute name="showTime" required="false" %>
<%@attribute name="disabled" required="false"%>

<c:if test="${empty disabled}">
    <c:set value="false" var="disabled"/>
</c:if>

<c:if test="${empty showTime}">
    <c:set var="showTime" value="false"/>
</c:if>

<c:if test="${empty onclick}">
    <c:set var="onclick" value="displayDatePicker('${path}', ${showTime})"/>
</c:if>

<%-- remember to include <script type='text/javascript' language="JavaScript" src="/script/eprocdatepicker.js"></script> --%>
<%-- any content can be specified here e.g.: --%>
<sf:input path="${path}" readonly="true" cssErrorClass="errors" disabled="${disabled}" />
<img align='top' border='0' height='15' src="/images/show-calendar.gif"  width='15' onClick ="${onclick}" >
<sf:errors path="${path}" delimiter="<br/>" cssClass="errorsTxt"/>