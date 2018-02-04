
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : user
    Created on : Aug 4, 2014, 12:58:38 AM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  tagdir="/WEB-INF/tags/" prefix="t"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .ui-jqgrid-hdiv {display:none !important;}
            .ui-widget-header {border: 0px solid;background: #F4F4F4 !important;min-height: 35px;}
            .ui-tabs .ui-tabs-nav li {margin: 0px .03em 0 0 !important; border-left: 0em !important;background: rgb(237, 240, 245) !important;}
            .ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {border-radius: 0px;}
            .ui-tabs .ui-tabs-nav {margin-left: 0px !important;margin-right: 0px !important;padding: .1em .1em 0 !important;width: 100% !important;float: left;}
            .ui-tabs .ui-tabs-panel {float: left;padding: .3em 9.5em !important;padding-left: .01em !important;}
            .ui-state-active{border-style: inset !important;}
            .ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited {color: #eb8f00;background:#ffffff !important;}
            .ui-jqgrid ui-widget ui-widget-content ui-corner-all{width: 100% !important;}
            #tabs .ui-widget-content {border: 0px solid #dddddd;background: #fafafa !important ;color: #333333;}
            #tabs .ui-widget-content {border: 0px solid #dddddd;border-radius: 0em !important;}
            #tabs .ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {border-bottom-right-radius: 0px; }
            #tabs .ui-jqgrid-bdiv{width: 112.5% !important;}
            #tabs .ui-jqgrid tr.ui-row-ltr td {border-right-width: 0px;}
            .ui-tabs{padding: 0px;}
        </style>
        <script>
            $(function() {
                var height = ($(window).height() * .71);
                var width = ($(window).width() * .735);
                $("#tabs").tabs({
                    activate: function(e, ui) {
                        loadGrid(ui.newTab.find("a").attr("href").replace("#", ""));
                    }
                });
                var grid = $("#grid");
                grid.jqGrid({
                    url: '/common/getsentdetails.htm',
                    datatype: "json",
                    height: height,
                    width: width,
                    multiselect: true,
                    colNames: [],
                    colModel: [
                        {name: 'id', index: 'id', width: 10, hidden: true},
                        {name: 'projectCode', index: 'projectCode', width: 25, formatter: function(cellValue, options, rowData) {
                                return "<a href='/nlc/common.htm?id=" + rowData.id +"'>" + cellValue + "</a>";
                            }},
                        {name: 'docId', index: 'docId', width: 50, editype: 'select', formatter: 'select', editoptions: {value:${docDesc}}},
                        {name: 'subject', index: 'subject', width: 100},
                        {name: 'createDate', index: 'createDate', width: 25, align: 'right', formatter: 'date', formatoptions: {srcformat: 'U/1000', newformat: 'd/m/Y'}}
                    ],
                    pager: '#pager',
                    viewrecords: true,
                    recordtext: '{0} - {1} of {2}',
                    pgtext: false
                });
                grid.jqGrid('navGrid', '#pager', {edit: false, add: false, del: false, refresh: false, search: false}).trigger("reloadGrid");
                $("div.lazy").lazyload({
                    load: function() {
                        $("#tabs").css('display', 'block');
                    },
                    trigger: "appear"
                });
            });
        </script>
    </head>
    <body>
        <div  class="lazy" data-original="/images/LoaderIcon.gif">
            <div id="tabs" style="overflow-x: hidden;border: 0px;display: none;">
                <ul>
                    <li><a href="#999">Primary</a></li>
                </ul>
                <div id="999" style="bottom: 0;right: 0;overflow: auto;">
                    <table id="grid" style="width: 100% !important;"></table>
                    <div id="pager" style="width: 112% !important;"></div>
                </div>
            </div>
        </div>
    </body>
</html>
