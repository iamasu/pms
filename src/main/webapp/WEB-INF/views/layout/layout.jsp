
<%-- 
    Document   : layout
    Created on : 20 Sep, 2012, 3:55:37 PM
    Author     : srini
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <head>
        <meta http-equiv="Content-Type;X-UA-Compatible" content="text/html; charset=utf-8; IE=edge"/>
        <link rel="stylesheet" href="/css/ccms-style.css" type="text/css"/>
        <link rel="stylesheet" href="/css/layout-style.css" type="text/css"/>
        <link rel="stylesheet" href="/css/themes/bootstrap-layout.css" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
        <link rel="stylesheet" type="text/css" href="/css/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" href="/css/settings.css" />
        <script type="text/javascript" src="/scripts/jquery.min.js"></script>
        <script type="text/javascript" src="/scripts/jquery.form.js"></script>
        <script type="text/javascript" src="/scripts/grid.locale-en.js"></script>
        <script type="text/javascript" src="/scripts/jquery-ui.js"></script>
        <script type="text/javascript" src="/scripts/jquery.jqGrid.src.js"></script>
        <script type="text/javascript" src="/scripts/jquery.jqGrid.min.js"></script>
        <script type="text/javascript" src="/scripts/localDataGridImplement.js"></script>
        <script type="text/javascript" src="/scripts/jquery.contextmenu.js"></script>
        <script type="text/javascript" src="/scripts/ajaxfileupload.js"></script>
        <script type="text/javascript" src="/scripts/jquery.lazyload.min.js"></script>
        <title><tiles:getAsString name="title"/></title>
        <style>
            body{font: Arial, Helvetica, sans-serif;}
            #nav{list-style:none;margin: 0px;
                 padding: 0px;}
            #nav li {
                float: left;
                margin-right: 0px;
                font-size: 14px;
                font-weight:bold;
            }
            #nav li a{color:#333333;text-decoration:none}
            #nav li a:hover{color:#006699;text-decoration:none}
            #notification_li{position:relative}
            #notificationContainer {
                background-color: #fff;
                border: 1px solid rgba(100, 100, 100, .4);
                -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                overflow: visible;
                position: fixed;
                top: 45px;
                margin-left: -150px;
                width: 400px;
                z-index: -1;
                display: none;
            }
            #notificationContainer:before {
                content: '';
                display: block;
                position: absolute;
                width: 0;
                height: 0;
                color: transparent;
                border: 10px solid black;
                border-color: transparent transparent white;
                margin-top: -20px;
                margin-left: 188px;
            }
            #notificationTitle {
                z-index: 1000;
                font-weight: bold;
                padding: 8px;
                font-size: 13px;
                background-color: #ffffff;
                width: 350px;
                border-bottom: 1px solid #dddddd;
            }
            #notificationsBody {
                padding: 33px 0px 0px 0px !important;
                min-height:300px;
                color: #333;
                margin:5px;
            }
            #notificationFooter {
                background-color: #e9eaed;
                text-align: center;
                font-weight: bold;
                padding: 8px;
                font-size: 12px;
                border-top: 1px solid #dddddd;
            }
            #notification_count {
                padding: 3px 7px 3px 7px;
                background: #cc0000;
                color: #ffffff;
                font-weight: bold;
                margin-left: 70px;
                border-radius: 9px;
                position: absolute;
                margin-top: -11px;
                font-size: 11px;
            }
        </style>
        <script>
            $(function() {
            <%--notification....--%>
                $("#notificationLink").click(function() {
                    $("#notificationContainer").fadeToggle(300);
                    $("#notification_count").fadeOut("slow");
                    return false;
                });
                $(document).click(function() {
                    $("#notificationContainer").hide();
                });
                $("#notificationContainer").click(function() {
                    return false;
                });
            <%--body height....--%>
                $('.bodyContent').css({'min-height': (($(window).height())) * .8});
                $(window).resize(function() {
                    $('.bodyContent').css({'min-height': (($(window).height())) * .8});
                });
            <%--menu height....--%>
                $('.menuContent').css({'min-height': (($(window).height())) * .8});
                $(window).resize(function() {
                    $('.menuContent').css({'min-height': ($(".bodyContent").height())});
                });
            });
        </script>
    </head>
    <body style="overflow-x: hidden;">
        <table  style="width: 100%;margin: 0px;padding: 0px;"  border="0"  cellspacing="0" cellpadding="0">
            <tr><td colspan="3"><tiles:insertAttribute name="header" /></td></tr>
            <tr><td colspan="3"><tiles:insertAttribute name="navigation" /></td></tr>
            <tr valign="top">
                <td rowspan="2" class="menuContent" style="max-width: 15%;width: 15%;min-width:15%;"><tiles:insertAttribute name="menu" /></td>
                <td valign="top" class="bodyContent bodylayout" style="max-width: 70%;min-width: 70%;width: 70%;"><tiles:insertAttribute name="body" /></td>
                <td valign="top" style="max-width: 15%;min-width: 15%;width: 15%;">
                    <div><%@include file="../common/messanger.jsp" %></div>
                </td>
            </tr>
            <tr><td colspan="3" style="text-align: center;" class="footer"><tiles:insertAttribute name="footer" /></td></tr>
        </table>
    </body>
</html>