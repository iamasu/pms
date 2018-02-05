<%-- 
    Document   : user
    Created on : Jan 20, 2016, 4:24:50 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Users</title>
        <script type="text/javascript">
            $(function() {
                $("#users").jqGrid({
                    url: '/regs/users.htm',
                    datatype: 'json',
                    colNames: ["ROLE", 'User Id', "User Name", "Password", "Compnay Name", "Address", "ZIP Code", "Country"],
                    colModel: [
                        {name: "userRole", index: "userRole", width: 20, sortable: false, editable: true, edittype: 'select', editoptions: {value: {"ADMIN": "ADMIN", "AIRLINE": "AIRLINE", "CPSE": "CPSE"}}},
                        {name: "userId", index: "userId", width: 20, sortable: false, editable: true, key: true, editrules: {required: true}},
                        {name: "firstName", index: "firstName", width: 30, sortable: false, editable: true, editoptions: {size: 20}},
                        {name: "password", index: "password", width: 20, sortable: false, hidden: true, editable: true, "formatter": "password", "edittype": "password", editrules: {required: true, edithidden: true}},
                        {name: "companyName", index: "companyName", width: 30, sortable: false, editable: true, editoptions: {size: 30}},
                        {name: "address", index: "address", width: 50, sortable: false, editable: true, edittype: 'textarea', editoptions: {rows: 2, cols: 45}},
                        {name: "zipCode", index: "zipCode", width: 20, sortable: false, editable: true, editrules: {number: true}},
                        {name: "country", index: "country", width: 20, sortable: false, editable: true, edittype: 'select', editoptions: {value: ${countryList}}}
                    ],
                    height:$(window).height() * .75,
                    autowidth: true,
                    rownumbers: true,
                    pager: '#userpager',
                    rowNum: 20,
                    rowList: [10, 20, 30],
                    viewrecords: true,
                    useDataProxy: true,
                    editurl: "/admin.htm"
                }).jqGrid('navGrid', '#userpager', {del: false, refresh: false, search: false},
                {closeAfterEdit: true, width: 400, reloadAfterSubmit: true, closeOnEscape: true},
                {closeAfterAdd: true, width: 400, reloadAfterSubmit: true, closeOnEscape: true});
            });
        </script>
    </head>
    <body>
        <div class="div div-grid">
            <div class="div-heading"><h3 class="div-title">Registered Users</h3></div>
            <table id="users"></table>
            <div id="userpager"></div>
        </div>
    </body>
</html>

