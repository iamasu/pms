<%-- 
    Document   : settings
    Created on : May 6, 2015, 11:55:42 AM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .ui-jqgrid-hdiv {display:none !important;}
            .ui-widget-header {border: 0px solid;background: #FFFFFF !important;min-height: 15px;}
            .ui-tabs .ui-tabs-nav li {margin: 0px .03em 0 0 !important; border-left: 0em !important;background: #FFFFFF !important;}
            .ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {border-radius: 0px;}
            .ui-tabs .ui-tabs-nav {margin-left: 0px !important;margin-right: 0px !important;padding: .1em .1em 0 !important;width: 100% !important;float: left;}
            .ui-tabs .ui-tabs-panel {float: left;padding: .0em 8.75em !important;padding-left: .01em !important;}
            .ui-state-active{border-style: none  !important;color: #333 !important;}
            .ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited {color: #eb8f00;background:#f5f5f5 !important;}
            .ui-widget-content { background: #f5f5f5 !important;border: 0px !important;}
            .ui-tabs .ui-tabs-nav li a {padding: .0em 1em !important;}
        </style>
        <script>
            $(function() {
                $("#settingtab").tabs({
                    active: $('.tabs ul').index($('#${tab}')),
                    activate: function(e, ui) {
                        window.location = document.location.href.replace(location.hash, "") + ui.newTab.find("a").attr("href");
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="div div-default" style="border: 0px !important;">
            <div class="div-body" id="settingtab" style="padding: 0px;overflow: hidden;background: #FAFAFA !important;">
                <ul>
                    <li><a href="#gen">General</a></li>
                    <li><a href="#themes" id="theme">Themes</a></li>
                </ul>
                <div id="themes" style="width: 100%;margin-top: 10px;">
                    <%@include  file="themes.jsp" %>
                </div>
            </div>
        </div>
    </body>
</html>
