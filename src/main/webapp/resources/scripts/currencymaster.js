
function addCurrency(tenderNo, formId,slectedCurrency) {

    if ($('#__showCurrencyMasterDiv__').length === 0 && tenderNo !== 'undefined') {
        $('<div id="__showCurrencyMasterDiv__" style="width:600px;"></div>').appendTo('body');

        $('<table id="__vendorGrid__"></table>').appendTo($('#__showCurrencyMasterDiv__'));
        $('<div id="__vendorGridPager__" ></div>').appendTo($('#__showCurrencyMasterDiv__'));

        $("#__vendorGrid__").jqGrid({
            url: "/vendor/vendorMasterAll.htm",
            datatype: "json",
            colNames: ['Code', 'Currency'],
            colModel: [
                {name: 'code', index: 'code', width: 100, sortable: false},
                {name: 'companyName', index: 'companyName', sortable: false, width: 460}
            ],
            height: 'auto',
            autowidth: true,
            multiselect:true,
            rowNum: 220,
            gridComplete: function() {
                $.each(slectedCurrency, function(i, rowId) {
                    $("#__vendorGrid__").jqGrid('setSelection', rowId, false);
                });
            }
        });

        $("#__showCurrencyMasterDiv__").dialog({
            title: 'Currency Selection',
            width: 640,
            height: 500,
            modal: true,
            draggable: false,
            resizable: false,
            autoResize: true,
            close: function() {
                $("#__showCurrencyMasterDiv__").jqGrid('GridUnload');
                $("#__showCurrencyMasterDiv__").remove();
            },
            buttons: {
                SUBMIT: function() {
                    var ids = $("#__vendorGrid__").jqGrid('getGridParam', 'selarrrow');
                    if (ids.length === '0') {
                        alert("please, select at least one vendor");
                        return false;
                    }
                    $.ajax({type: 'POST',
                        url: '/tenderAssign/tenderNo/' + tenderNo + '/vendorIds/' + ids,
                        success: function(reponse) {
                            alert(reponse);
                            window.location = '/nib/Entry/tender/' + tenderNo;
                        }});
                    $(this).dialog("close");
                }}
        });
    } else {
        $('#__showCurrencyMasterDiv__').dialog('open');
    }
}