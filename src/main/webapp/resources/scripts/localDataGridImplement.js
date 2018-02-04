function onclickSubmit(grid) {
    var onclickSubmitData = function(options, postdata) {
        var gridP = grid[0].p,
                idname = gridP.prmNames.id,
                gridId = grid[0].id,
                idInPostdata = gridId + "_id",
                rowid = postdata[idInPostdata],
                addMode = rowid === "_empty",
                oldValueOfSortColumn,
                newId;
        if (addMode) {
            newId = gridP.records + 1;
            postdata[idname] = newId;
            rowid = newId;
        } else if (typeof (postdata[idname]) === "undefined") {
            postdata[idname] = rowid;
        }
        delete postdata[idInPostdata];
        oldValueOfSortColumn = gridP.sortname === "" ? undefined : grid.jqGrid('getCell', rowid, gridP.sortname);
        if (addMode) {
            grid.jqGrid("addRowData", rowid, postdata, options.addedrow);
        } else {
            grid.jqGrid("setRowData", rowid, postdata);
            addHiddenField(grid, gridId);
        }

        if ((addMode && options.closeAfterAdd) || (!addMode && options.closeAfterEdit)) {
            $.jgrid.hideModal("#editmod" + gridId,
                    {gb: "#gbox_" + gridId, jqm: options.jqModal, onClose: options.onClose});
        }
        if (postdata[gridP.sortname] !== oldValueOfSortColumn) {
            setTimeout(function() {
                grid.trigger("reloadGrid", [{current: true}]);
            }, 100);
        }
        this.processing = true;
        return {};
    };
    return onclickSubmitData;

}

function addHiddenField(grid) {
    var colNames = grid[0].p.colModel;
    var path = grid[0].id;
    $('div').remove('.hiddenflyform');
    $(document.createElement('div'));
    $('<div class="hiddenflyform"></div>').appendTo('form');
    $.each(colNames, function(i, col) {
        var colName = colNames[i].name;
        var colData = grid.jqGrid('getCol', colName, false);
        $.each(colData, function(idx, data) {
            $('<input>').attr({
                type: 'hidden',
                name: path + "[" + idx + "]." + colName,
                id: path + idx + "." + colName,
                value: data}).appendTo('.hiddenflyform');
        });
    });
}

function addHiddenField4ProjectStruc(grid) {
    var colNames = grid[0].p.colModel;
    $('div').remove('.hiddenflyform3');
    $(document.createElement('div'));
    $('<div class="hiddenflyform3"></div>').appendTo('form');
    $.each(colNames, function(i, col) {
        var colName = colNames[i].name;
        var colData = grid.jqGrid('getCol', colName, false);
        $.each(colData, function(idx, data) {
            $('<input>').attr({
                type: 'hidden',
                name: "volumes[" + i + "].sections[" + idx + "]." + colName,
                id: "volumes" + i + "sections" + idx + "." + colName,
                value: data}).appendTo('.hiddenflyform3');
        });
    });
}

function editSetting(grid) {
    var editSettings = {
        recreateForm: true,
        jqModal: true,
        reloadAfterSubmit: false,
        closeOnEscape: true,
        savekey: [true, 13],
        closeAfterEdit: true,
        width: 'auto',
        onclickSubmit: onclickSubmit(grid)
    };
    return editSettings;
}
function addSetting(grid) {
    var addSettings = {
        recreateForm: true,
        jqModal: true,
        reloadAfterSubmit: false,
        addedrow: 'afterSelected',
        savekey: [true, 13],
        closeOnEscape: true,
        closeAfterAdd: true,
        width: 'auto',
        onclickSubmit: onclickSubmit(grid)
    };
    return addSettings;
}
function delSetting(grid) {
    var delSettings = {
        afterShowForm: function($form) {
            var form = $form.parent()[0], dialog;
            $("#dData", form).attr("tabindex", "1000");
            $("#eData", form).attr("tabindex", "1001");
            setTimeout(function() {
                $("#dData", form).focus();
            }, 50);
            dialog = $form.parent().parent();
            dialog.position({
                my: "center",
                of: grid.closest('div.ui-jqgrid')
            });
        },
        onclickSubmit: function(options) {
            var gridId = grid[0].id,
                    gridP = grid[0].p,
                    newPage = gridP.page,
                    rowids = gridP.multiselect ? gridP.selarrrow : [gridP.selrow];
            options.processing = true;
            $.each(rowids, function() {
                grid.jqGrid('delRowData', this);
            });
            var savedData = grid.jqGrid('getRowData');
            grid.jqGrid('clearGridData');
            grid.jqGrid('addRowData', 'rn', savedData);
            $.jgrid.hideModal("#delmod" + gridId,
                    {gb: "#gbox_" + gridId,
                        jqm: options.jqModal,
                        onClose: options.onClose});
            if (gridP.lastpage > 1) {
                if (gridP.reccount === 0 && newPage === gridP.lastpage) {
                    newPage -= 1;
                }
                grid.trigger("reloadGrid", [{page: newPage}]);
            }

            return true;
        },
        processing: true
    };
    return delSettings;
}
function addContextMenu(myMenu, grid) {
    $(document.createElement('div'));
    $('<div id="' + myMenu + '" style="display: none">' +
            '<ul style="width: 200px">' +
            '<li id="add"><span class="ui-icon ui-icon-plus" style="float: left"></span><span' +
            'style="font-size: 11px; font-family: Verdana">Add Row</span> </li>' +
            '<li id="edit"><span class="ui-icon ui-icon-pencil" style="float: left"></span><span' +
            'style="font-size: 11px; font-family: Verdana">Edit Row</span> </li>' +
            '<li id="del"><span class="ui-icon ui-icon-trash" style="float: left"></span><span' +
            'style="font-size: 11px; font-family: Verdana">Delete Row</span> </li>' +
            ' </ul>' +
            '</div>').appendTo('body');
    grid.contextMenu(myMenu, {
        bindings: {
            edit: function(trigger, currentTarget) {
                var rowId = $(currentTarget).closest("tr.jqgrow").attr("id");
                grid.jqGrid('editGridRow', rowId, editSetting(grid));
            },
            add: function() {
                grid.jqGrid('editGridRow', "new", addSetting(grid));
            },
            del: function(trigger, currentTarget) {
                var rowId = $(currentTarget).closest("tr.jqgrow").attr("id");
                grid.jqGrid('delGridRow', rowId, delSetting(grid));
            }
        },
        onContextMenu: function(e) {
            var rowId = $(e.target).closest("tr.jqgrow").attr("id");
            if (rowId) {
                grid.jqGrid('setSelection', rowId);
                return true;
            } else {
                return false; // no contex menu
            }
        }
    });
}
function getEditType(grid, row, cellValue, colName) {
    var cm = grid.jqGrid('getColProp', colName);
    if (cellValue === '0' || cellValue === '1' || cellValue === '2' || cellValue === '3') {
        cm.editable = false;
    }
    else if (cellValue === '8' || cellValue === '9') {//8 text mandatory 12text opt
        cm.edittype = 'text';
        cm.editoptions = {autosize: true};
        cm.editable = true;
    } else if (cellValue === '11' || cellValue === '12') {
        cm.edittype = 'textarea';
        cm.formatter = 'textarea';
        cm.editoptions = {cols: 50};
        cm.editable = true;
    } else if (cellValue === '13' || cellValue === '14') {//13 date mandatory ,14opt
        cm.edittype = 'text';
        cm.editable = true;
        cm.editoptions = {size: 50};
        cm.formatter = 'date';
        cm.formatoptions = {newformat: 'd-M-Y'};
        cm.datefmt = 'd-M-Y';
        cm.editoptions = {dataInit: initDateEdit, size: 21, readonly: 'readonly'};
    } else if (cellValue === '15' || cellValue === '16') {
        grid.jqGrid('restoreRow', row);
        cm.edittype = 'custom';
        cm.editable = true;
        cm.editoptions = {
            custom_element: function(value) {
                var elm = $('<input type="number" pattern="[0-9]+([\.][0-9]+)?" step="0.01" style="width:150px;" class="numClass"/>');
                elm.val(value);
                return elm;
            }
        };
        grid.jqGrid('editRow', row);
    } else if (cellValue === '22') {//22 drop mandatory ,23opt
        cm.edittype = 'select';
        cm.editable = true;
    } else if (cellValue === '23') {//22 drop mandatory ,23opt
        cm.edittype = 'select';
        cm.editable = true;
    } else if (cellValue === '51') {
        cm.edittype = 'file';
        cm.formatter = 'file';
        cm.editoptions = {enctype: "multipart/form-data", alt: 'file upload'};
        cm.editable = true;
    }
    else if (cellValue === '1111') {//YES/ NO
        cm.edittype = 'select';
        cm.editable = true;
        cm.editoptions = {value: {'YES': 'YES', 'NO': 'NO'}};
        grid.jqGrid('editRow', row);
    } else if (cellValue === '121212') {//121212 Applicable
        cm.edittype = 'select';
        cm.editable = true;
        cm.editoptions = {value: {'NA': 'NA', 'Applicable': 'Applicable'}};
        grid.jqGrid('editRow', row);
    } else {
        cm.editable = false;
    }

    return cm;
}

function initDateEdit(elem) {
    setTimeout(function() {
        $(elem).datepicker({
            dateFormat: 'dd/mm/yy',
            showOn: 'button',
            changeYear: true,
            changeMonth: true
        });
    }, 100);
}

