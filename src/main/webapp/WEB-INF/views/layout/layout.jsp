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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--<title><tiles:getAsString name="title"/></title>--%>
        <link rel="shortcut icon" href="/images/favicon.png"> 
        <link type="text/css" href="/css/layout.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
        <link type="text/css" href="/css/ccms-style.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/css/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" href="/scripts/bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="/scripts/bootstrap/css/bootstrap-theme.css" />
        <script type="text/javascript" src="/scripts/jquery.min.js" language="javascript" ></script>
        <script type="text/javascript" src="/scripts/jquery-ui-min.js" language="javascript"></script>
        <script type="text/javascript" src="/scripts/jquery.form.js"  language="javascript" ></script>
        <script type="text/javascript" src="/scripts/grid.locale-en.js"  language="javascript" ></script>
        <script type="text/javascript" src="/scripts/jquery.jqGrid.src.js"  language="javascript" ></script> 
        <script type="text/javascript" src="/scripts/jquery.jqGrid.src.js"  language="javascript" ></script> 
        <script type="text/javascript" src="/scripts/localDataGridImplement.js"  language="javascript" ></script> 
        <script type="text/javascript" src="/scripts/bootstrap/js/bootstrap.js" language="javascript" ></script>
        <script type="image/svg+xml" src="/scripts/bootstrap/fonts/fontawesome-webfont.svg" language="javascript" ></script>
        <script type="text/javascript">
            $().ready(function() {
                $("#content-body").css('height', $(window).height() * .88);
                $(window).bind("resize", function() {
                    $("#content-body").css('height', $(window).height() * .88);
                });
            });
        </script>
    </head>
    <body style="overflow-x: hidden;background: url(data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABVAAD/4QMraHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjAtYzA2MCA2MS4xMzQ3NzcsIDIwMTAvMDIvMTItMTc6MzI6MDAgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzUgTWFjaW50b3NoIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjM5RDRDOEYzQ0QzNjExRTFBRTIwRkUzMzM4MTZCOEQzIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjM5RDRDOEY0Q0QzNjExRTFBRTIwRkUzMzM4MTZCOEQzIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MzlENEM4RjFDRDM2MTFFMUFFMjBGRTMzMzgxNkI4RDMiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MzlENEM4RjJDRDM2MTFFMUFFMjBGRTMzMzgxNkI4RDMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAACAQEBAQECAQECAwIBAgMDAgICAgMDAwMDAwMDBQMEBAQEAwUFBQYGBgUFBwcICAcHCgoKCgoMDAwMDAwMDAwMAQICAgQDBAcFBQcKCAcICgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCAAkACADAREAAhEBAxEB/8QAYwABAQEBAAAAAAAAAAAAAAAAAAECCQEBAAAAAAAAAAAAAAAAAAAAABABAAEDAgUDAwUAAAAAAAAAAREhAhIAMfBBYSIyUaETsfFiccFCggMRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/AO7clpAhbVm52g330EItG1cY2PRd3f25aCN6DyBneh1WePoFvcWRxibt5x3Jo1H04AXXBbyMav49YmpoDfbatygWmRWIGksJOgJbOUtpbNyz4+q1roF1y0tO47pOSi5RPN5cAR/0ttEUyt7m6dq71emgo3TksJ3JK4k7+VR9NBcriniFd9q7oPtoM8isNvd3MxMzc1J/TQLh/wAysW2i3TPi1J326aCyQj2x7MzO+gWsXYzEBcfjNDnz46AVtFaB4k+LUlh9uADnT49pccs4y+2gM/w8o7fKc6z+0fbQZPlxcfCH45zjOXj6aDT8s2/HM/2jLrFNB//Z) repeat 0 0 #f8f8f8;">
        <div>
            <div><tiles:insertAttribute name="header" /></div>
            <div style="background: #E8E8E8;padding-left: 10%;padding-right: 10%;">
                <div id="content-body" style="background: #F4F4F4;padding-top: 25px;"><tiles:insertAttribute name="body" /></div>
            </div>
            <div  id='footer' style="text-align: center;background: #EFEFEF;bottom: 0px;"><tiles:insertAttribute name="footer" /></div>
        </div>
    </body>
</html>