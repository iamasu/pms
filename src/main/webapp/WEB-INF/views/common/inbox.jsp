
<%-- 
    Document   : inbox
    Created on : Oct 25, 2014, 10:33:45 PM
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
            #tabs .ui-jqgrid ui-widget ui-widget-content ui-corner-all{width: 100% !important;}
            #tabs .ui-widget-content {border: 0px solid #dddddd;background: #fafafa !important ;color: #333333;}
            #tabs .ui-widget-content {border: 0px solid #dddddd;}
            #tabs .ui-jqgrid-bdiv{width: 112.5% !important;}
            #tabs .ui-jqgrid tr.ui-row-ltr td {border-right-width: 0px;}
            .ui-tabs{padding: 0px;}
        </style>
        <script>
            function loadGrid(id) {
                var height = ($(window).height() * .71);
                var width = ($(window).width() * .735);
                var grid = $("#grid" + id);
                if ($(grid).length !== 0) {
                    $(grid).jqGrid('setGridParam', {url: '/getinboxdetails.htm?docId=' + id, datatype: "json"}).trigger("reloadGrid");
                }
                grid.jqGrid({
                    url: '/getinboxdetails.htm?docId=' + id,
                    datatype: "json",
                    height: height,
                    width: width,
                    shrinkToFit: true,
                    scrollOffset: 0,
                    multiselect: true,
                    colNames: [],
                    colModel: [
                        {name: 'id', index: 'id', width: 10, hidden: true},
                        {name: 'projectCode', index: 'projectCode', width: 25, formatter: function(cellValue, options, rowData) {
                                return "<a href='/nlc/common.htm?id=" + rowData.id+ "'>" + cellValue + "</a>";
                            }},
                        {name: 'docId', index: 'docId', width: 50, editype: 'select', formatter: 'select', editoptions: {value:${docDesc}}},
                        {name: 'subject', index: 'subject', width: 100},
                        {name: 'createDate', index: 'createDate', width: 25, align: 'right', formatter: 'date', formatoptions: {srcformat: 'U/1000', newformat: 'd/m/Y'}},
                        {name: 'sentDate', index: 'sentDate', hidden: true}
                    ],
                    pager: '#pager' + id,
                    viewrecords: true,
                    recordtext: '{0} - {1} of {2}',
                    pgtext: false
                });
                grid.jqGrid('navGrid', '#pager' + id, {edit: false, add: false, del: false, refresh: false, search: false}).trigger("reloadGrid");
                $('.ui-jqgrid-bdiv').css({'width': (($(window).width())) * .75});
            }
            $(function() {
                loadGrid(999);//default
                $("#tabs").tabs({
                    activate: function(e, ui) {
                        loadGrid(ui.newTab.find("a").attr("href").replace("#", ""));
                    }
                });
                $("#addnewtab").click(function() {
                    $(document.createElement('div')).appendTo('body')
                            .html("<div style='float:left;width:25%;'><table id='tabsList'></table></div><div id='dummy' style='float:left;padding-left:50px;'><p><p></div>")
                            .dialog({
                                modal: true, autoOpen: true,title:'Select tabs to enable', width: '50%', height: '500', resizable: false, draggable: false,
                                buttons: {
                                    Save: function() {
                                        var ids = $('#tabsList').jqGrid('getGridParam', 'selarrrow');
                                        if (ids.length === 0) {
                                            ids = 999;
                                        }
                                        $.ajax({type: 'POST',
                                            url: '/activatetabs/' + ids, success: function() {
                                                window.location = '/admin/user.htm';
                                            }
                                        });
                                    },
                                    Cancel: function() {
                                        $(this).remove();
                                    }
                                },
                                close: function() {
                                    $(this).remove();
                                }, open: function() {
                                    $('#tabsList').jqGrid({
                                        url: '/gettabs.htm',
                                        datatype: 'json',
                                        cmTemplate: {sortable: false, editable: true},
                                        colNames: [],
                                        multiselect: true,
                                        colModel: [
                                            {name: 'id', index: 'id', label: 'ID', hidden: true},
                                            {name: 'tabName', index: 'tabName', label: 'Tab Name'},
                                            {name: 'activate', index: 'activate', label: 'Active', edittype: 'checkbox', formatter: 'checkbox', hidden: true}
                                        ],
                                        loadui:false,
                                        width: "25%",
                                        shrinkToFit: true,
                                        scrollOffset: 0,
                                        gridComplete: function() {
                                            var ids = $("#tabsList").jqGrid('getDataIDs');
                                            $.each(ids, function(i, rowId) {
                                                var rowData = $("#tabsList").jqGrid('getRowData', rowId);
                                                if (rowData.activate === 'Yes') {
                                                    $("#tabsList").jqGrid('setSelection', rowId, false);
                                                }
                                            });
                                        }
                                    });
                                }
                            }).prev(".ui-dialog-titlebar").addClass("titlebar");
                });
                $("div.lazy").lazyload({
                    load: function() {
                        $("#tabs").css('display','block');
                    },
                    trigger: "appear"
                });
            });
        </script>
    </head>
    <body>
        <div class="lazy" data-original="/images/LoaderIcon.gif">
            <div id="tabs" style="overflow: hidden;border:0px;display: none;">
                <ul>
                    <li><a href="#999">Primary</a></li>
                        <c:forEach items="${tabs}" var="tab">
                            <c:if test="${tab.activate}">
                            <li><a href="#${tab.docId}">${tab.tabName}</a></li>
                            </c:if>
                        </c:forEach>
                    <li><a id="addnewtab" style="cursor: pointer;color: #333333;max-width: 2px;font-weight: bolder;">+</a></li>
                </ul>
                <div id="999" style="max-width: 100%;bottom: 0;right: 0;overflow: auto;">
                    <table id="grid999" style="width: 100% !important;"></table>
                    <div id="pager999" style="width: 112% !important;"></div>
                </div>
                <c:forEach items="${tabs}" var="tab">
                    <c:if test="${tab.activate}">
                        <div id="${tab.docId}" style="max-width: 100%;bottom: 0;right: 0;overflow: auto;">
                            <table id="grid${tab.docId}"  style="width: 100% !important;"></table>
                            <div id="pager${tab.docId}" style="width: 112% !important;"></div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </body>
</html>


