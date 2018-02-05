<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<%@ page session="true"%>
<fmt:message key="message.password" var="noPass" />
<fmt:message key="message.username" var="noUser" />

<div id="header">
    <div id="logo">
        <!--<a href="?lang=en"><spring:message code="label.form.loginEnglish"/></a> |--> 
        <!--<a href="?lang=es_ES"><spring:message code="label.form.loginSpanish"/></a>-->
        <h1><img src="/images/asu.png" alt="" style="height: 45px;width: 200px;"/></h1>
        <p>Hello I am Asu</p>
    </div>
    <div id="newsletter">
        <p>Log In</p>
        <form name='f' action="/login.htm" method='POST'>
            <fieldset>
                <input type="text" name='j_username' value="Email&hellip;"  onfocus="this.value = (this.value === 'Email&hellip;') ? '' : this.value;" />
                <input type="password" name='j_password' value="Password&hellip;"  onfocus="this.value = (this.value === 'Password&hellip;') ? '' : this.value;" />
                <input type="submit" name="news_go" id="news_go" value="<spring:message code="label.form.login"/>" />
            </fieldset>
            <div style="padding-top: 5px;vertical-align: middle;">
                <div style="float: left;padding-top: 2px;"><input style="width: auto;margin: 0px;" type="checkbox" id="_spring_security_remember_me" name="_spring_security_remember_me"/></div>
                <div style="float: left;margin-right: 5px;">Keep me logged in</div>
                <div style="float: left;color: #ff6666;font-size: 10px;padding: 0px;margin: 0px;" >
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
                        <div class="alert alert-error">
                            ${param.message}
                        </div>
                    </c:if>
                </div>
                <div style="float: right">Forgot Password</div>
            </div>
        </form>
    </div>
    <br class="clear" />
</div>