<%-- 
    Document   : login
    Created on : Apr 1, 2015, 2:03:00 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Welcome To My Website</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>
        <link rel="stylesheet" media="screen" type="text/css" href="/css/bootstrap/font-awesome/css/font-awesome.css"/>
        <link rel="stylesheet" media="screen" type="text/css" href="/css/bootstrap/bootstrap.min.css"/>
        <script type="text/javascript" src="/scripts/jquery.min.js"></script>
        <link rel="stylesheet" media="screen" href="/css/layout/layout.css" type="text/css" />
        <link rel="stylesheet" media="screen" href="/css/layout/styles-6.css"/>
        <style type="text/css">
            .alert {padding: 0px !important;margin-bottom: 0px !important;}
            .active a{color: #FFFFFF !important;background-color: #059BD8 !important;}
        </style>
        <script type="text/javascript">
            $(function() {
                $('.topnav> li> a').each(function() {
                    if ($(this).attr('href') === (window.location.pathname)) {
                        $(this).parent().closest('li').addClass('active');
                    }
                });
                $("#main-body").css({'min-height': ($(window).height() * 0.6)});
            });
        </script>
    </head>
    <body id="top">
        <div class="wrapper col1">
            <tiles:insertAttribute name="header"/>
        </div>
        <div class="wrapper col2">
            <tiles:insertAttribute name="topbar"/>
        </div>
        <div class="wrapper" id="main-body">
            <tiles:insertAttribute name="body"/>
        </div>
        <div class="wrapper col6">
            <tiles:insertAttribute name="footer"/>
        </div>
    </body>
</html>