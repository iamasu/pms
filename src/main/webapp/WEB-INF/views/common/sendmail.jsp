
<%-- 
    Document   : sendmail
    Created on : Oct 20, 2014, 2:12:36 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .ui-icon-calendar {background-position: -32px -111px;}
            .toggle {border:1px solid #DDDDDD;border-width: 0px 0px 1px 0px;padding:10px;cursor: pointer}
            .answer {border:1px solid #DDDDDD;border-width: 0px 0px 1px 0px;padding:10px;width: 90%;background: #FEFEFE;}
            .div-grid ul,ol{list-style: element !important;}
            input[type=text],select {box-sizing: content-box !important;border: 1px inset !important;} 
        </style>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.answer').hide();
                $(".toggle").click(function() {
                    $(".answer").not($(this).next()).hide(1);
                    $("div[rel='profile_" + $(this).attr("profile") + "']").toggle(1);
                });
                $('#activeReply').click(function() {
                    if ($.trim($(this).text()) === 'Reply') {
                        $('#showReply').css('display', 'block');
                        $(this).text('Cancel');
                    } else {
                        $('#showReply').css('display', 'none');
                        $(this).text('Reply');
                    }
                });
                $("#height").css('min-height', $(window).height() * .84);
                $(window).bind("resize", function() {
                    $("#height").css('min-height', $(window).height() * .84);
                });
            });
        </script>
    </head>
    <body style="overflow-x: hidden;">
        <div class="div div-default">
            <c:choose>
                <c:when  test="${docId==200 || docId==3 || docId==10 || docId==9}"><t:projectdetails project="${project}" volumes="${volumes}"/><br/></c:when>
                <c:when  test="${docId==24}"><t:masterScheduleList msdList="${msdList}" LOA="${loa}"/><br/></c:when>
                <c:when  test="${docId==25}"><t:drawingDetails commandName="${msd}" loa="${loa}"/><br/></c:when>
            </c:choose>
            <div class="div-body" style="padding: 0px;">
                <c:set var="count" value="1"/>
                <c:forEach items="${comm4Display}" var="commD" varStatus="row">
                    <div id="comm_con" style="max-width: 98%;">
                        <div style="display: inline-block;width: 100%;max-height: 30px;text-align: left;" class="toggle" profile='${count}'>
                            <div style="float: left;width: 80%;">
                                <div style="float: left;">
                                    <img src="/images/user_mask.png" style="background-color: #cccccc">
                                </div>
                                <div style="float: left;padding-left: 5px;">
                                    <span style="font-weight: bold;color: #333;text-align: left;">${commD.subject}<br/></span>
                                    <span style="float: left;">${commD.user}</span>
                                </div>
                            </div>
                            <div style="float: right;margin-top: 20px;width: 20%;min-width: 170px;">
                                <div style="float: right;"><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss a" value="${commD.sentDate}"/></div> <div class="ui-icon ui-icon-calendar" style="float: right;"></div>
                            </div>
                        </div>
                        <div class="answer" rel='profile_${count}' style="padding-left: 11% !important;display: block;text-align: left;max-width: 75%;"><pre style="font-family: sans-serif;">${commD.message}</pre></div>
                    </div>
                    <c:set var="count" value="${count+1}"/>
                </c:forEach>
                <c:if test="${not comm.send}">
                    <span style="color: #ff9999;">${errormsg}</span>
                    <div class="div-footer" style="text-align: right;margin-bottom: 20px;"><button title="Reply" id="activeReply" style="cursor: pointer;" title="reply now">Reply</button></div>
                    <div style="display: none${errormsg};" id="showReply">
                        <sf:form commandName="comm" enctype="multipart/form-data">
                            <div style="margin-left: 10%;min-width: 75%;width: 75%;background: #FEFEFE;">
                                <div>
                                    <div style="margin-top: -10px;padding-bottom: 20px;text-align: left;">
                                        <img src="/images/user_mask.png" style="background-color: #cccccc;float: left;">
                                        <span><br/>to 
                                            <span style="display: inline-block;background: #f5f5f5;border: 1px;">NLC,</span>
                                            <span style="display: inline-block;background: #f5f5f5;">${vm.companyName}</span>
                                        </span>
                                    </div>
                                    <div>
                                        <sf:select path="docId" style="width: 200px;display:none">
                                            <c:forEach items="${tabs}" var="tab">
                                                <option label="${tab.tabName}" value="${tab.docId}" <c:if test="${tab.docId==docId}">selected</c:if>/>
                                            </c:forEach>
                                        </sf:select>
                                    </div>
                                    <div style="text-align: left;">
                                        <input type="text" required="true" name="subject" maxlength="60" id="subject" placeholder="subject"  style="width: 60%;height: 20px;"/>
                                    </div>
                                    <div>
                                        <t:maileditor path="message" height="200"/>
                                    </div>
                                    <div style="background: #F9F9F9;">
                                        <c:choose>
                                            <c:when test="${docId==25 || docId==24 || docId==72|| docId==71}">
                                                <div style="background: #f5f5f5;width: 755px;overflow: hidden;">
                                                    <sf:radiobutton path="status" value="2"/>Accept <sf:radiobutton path="status" value="3"/>Commented
                                                </div>
                                            </c:when>
                                            <c:otherwise><sf:hidden path="status" value="5"/></c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div style="float: left;margin: 1px;background: #F6F6F6;width: 750px;padding-bottom: 10px;padding-top: 10px;">
                                        <div style="text-align: left;"> <input type="submit" value="Send" style="box-shadow: none;background: -webkit-gradient( linear, left top, left bottom, color-stop(5%, #4D90FE), color-stop(100%, #4D90FE) ) !important;background-image: -moz-linear-gradient(center top , #4D90FE, #4787ED);border: 1px solid #3079ED;color: #FFF;"/></div>
                                            <sf:hidden path="id"/>
                                            <sf:hidden path="docId"/>
                                            <sf:hidden path="coordinatorId"/>
                                            <sf:hidden path="consultantId"/>
                                            <sf:hidden path="revisionNo"/>
                                            <sf:hidden path="projectCode"/>
                                    </div>
                                </div>
                            </div>
                        </sf:form>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>
