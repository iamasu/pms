function onclickSubmit(grid) {
    var onclickSubmitData = function(options, postdata) {
        var gridP = grid[0].p, idname = gridP.prmNames.id, gridId = grid[0].id, idInPostdata = gridId + "_id",
                rowid = postdata[idInPostdata], addMode = rowid === "_empty", oldValueOfSortColumn, newId;
        if (addMode) {
            newId = $.jgrid.randId();
            while ($("#" + $.jgrid.jqID(newId)).length !== 0) {
                newId = $.jgrid.randId();
            }
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
        }

        if ((addMode && options.closeAfterAdd) || (!addMode && options.closeAfterEdit)) {
            $.jgrid.hideModal("#editmod" + gridId, {gb: "#gbox_" + gridId, jqm: options.jqModal, onClose: options.onClose});
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
   var addSettings = {recreateForm: true, jqModal: true, reloadAfterSubmit: false, addedrow: 'afterSelected', savekey: [true, 13],
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
