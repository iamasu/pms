/* 
 * Asu
 */

var specialKeys = new Array();
specialKeys.push(8); //Backspace
$(function() {
    //numeric
    document.createElement('span');
    $('<span class="integerError" style="color: Red; display: none">* Input digits (0 - 9)</span>').appendTo('#error');
    $(".integer").bind("keypress", function(e) {
        var keyCode = e.which ? e.which : e.keyCode;
        var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
        $(".integerError").css("display", ret ? "none" : "inline");
        return ret;
    });
    $(".integer").bind("paste", function(e) {
        return false;
    });
    $(".integer").bind("drop", function(e) {
        return false;
    });
//double value
    document.createElement('span');
    $('<span class="doubleError" style="color: Red; display: none">* Input only (0 - 9,.)</span>').appendTo('#error');
    $(".double").bind("keypress", function(e) {
        var keyCode = e.which ? e.which : e.keyCode;
        var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode === 46);
        $(".doubleError").css("display", ret ? "none" : "inline");
        return ret;
    });
    $(".double").bind("paste", function(e) {
        return false;
    });
    $(".double").bind("drop", function(e) {
        return false;
    });
});

