/* 
 *Asu
 */
$(function() {
    $(':text').focusin(function() {
        $(this).css('background-color', '#F2F2F2');
        $(this).css('border', '-1px');
    });

    $(':text').blur(function() {
        $(this).css('background-color', '#FFF');
    });
    $(':button').click(function() {
        $(this).attr('value', 'please wait......');
        $(this).attr('disable', 'true');
    });

});
