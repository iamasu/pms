<%-- 
    Document   : tabs
    Created on : Oct 18, 2014, 11:40:41 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            $(function() {
                $('#tabsList').jqGrid({
                    url: '/gettabs.htm',
                    datatype: 'json',
                    cmTemplate: {sortable: false, editable: true},
                    colNames: [],
                    colModel: [
                        {name: 'id', index: 'id',label:'ID'},
                        {name: 'docId', index: 'docId',label:'Doc Id'},
                        {name: 'tabName', index: 'tabName',label:'Tab Name'},
                        {name: 'activate', index: 'activate',label:'Active', edittype: 'checkbox', formatter: 'checkbox'}
                    ],
                    autowidth: true,
                    editurl: '/addtab.htm',
                    pager:'#pager'
                }).jqGrid('navGrid','#pager',{},{closeAfterEdit:true,closeOnEscape:true},{closeAfterAdd:true,closeOnEscape:true});
            });
        </script>
    </head>
    <body>
        <div class="div div-blue">
            <div class="div-heading"><h3 class="div-title">Tabs</h3></div>
            <div class="div-body">
                <table id="tabsList"></table>
                <div id="pager"></div>
            </div>
            <div class="div-footer"></div>
        </div>
    </body>
</html>
