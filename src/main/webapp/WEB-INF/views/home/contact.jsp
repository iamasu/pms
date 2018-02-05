<%-- 
    Document   : contact
    Created on : Jan 14, 2017, 11:52:32 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<html>
    <head>
        <title>Log In</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>
        <link rel="stylesheet" media="screen" type="text/css" href="/css/bootstrap/font-awesome/css/font-awesome.css"/>
        <link rel="stylesheet" media="screen" type="text/css" href="/css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" media="screen" href="/css/layout/layout.css" type="text/css" />
        <link rel="stylesheet" media="screen" href="/css/layout/styles-6.css"/>
        <script type="text/javascript" src="/scripts/ckeditor/ckeditor.js"></script>
        <style type="text/css">
            .cke_top {padding: 0px 0px 0px !important;border-bottom: 0px solid #b6b6b6 !important;}
        </style>
        <script type="text/javascript">
            $(function() {
                if (CKEDITOR.instances.sentMessage) {
                    CKEDITOR.instances.sentMessage.destroy();
                }
                CKEDITOR.replace('sentMessage', {
                    on: {
                        change: function(event) {
                            $(this).val(event.editor.getData().replace(/(\r\n|\n|\r)/gm, ""));
                            $("#sentMessage").val(event.editor.getData().replace(/(\r\n|\n|\r)/gm, ""));
                        }
                    },
                    toolbar: [
                        {name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'TextColor', 'BGColor', 'NumberedList', 'BulletedList', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'Format', 'Font', 'FontSize', 'Table', 'SelectAll', 'Maximize']},
                        {name: 'attachment', items: ['attachment']}
                    ],
                    height: 150,
                    width: ($(window).width() * 0.5),
                    title: false,
                    toolbarLocation: 'bottom',
                    toolbarCanCollapse: false
                });
            });
        </script>
    </head>
    <body id="top">
        <div>
            <div id="intro">
                <div class="div div-default" style="padding-top: 30px;float: right;width: 60%;">
                    <sf:form commandName="message">
                        <div class="div-body">
                            <table>
                                <tr>
                                    <td><input cssStyle="width:50%;" required='true' placeholder='Enter Your Name' name="subject"/></td>
                                </tr>
                                <tr>
                                    <td><input cssStyle="width:50%;" required='true' placeholder='Enter Email' name="replyTo"/></td>
                                </tr>
                                <tr>
                                    <td><textarea name="text" id="sentMessage"/></td>
                                </tr>
                            </table>
                        </div>
                        <div class="div-footer" style="float: left;padding: 0px;padding-top: 10px;">
                            <button class="btn btn-primary " type="submit" id="sendmail">Send</button>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>