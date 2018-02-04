
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="navigation">
    <c:set value="${sessionScope['__user__']}" var="__user__"/>
    <div style="height: 18px;padding: 5px 5px 0 5px;position: relative;float: left;margin-right: 10px;">Welcome ${__user__.firstName}</div>
</div>
