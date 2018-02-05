<%-- 
    Document   : textarea
    Created on : Sep 8, 2014, 1:19:29 AM
    Author     : Asu
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="path" required="true"%>
<%@attribute name="onclick" required="false"%>
<%@attribute name="placeholder" required="false"%>
<%@attribute name="style" required="false"%>

<%-- any content can be specified here e.g.: --%>

<textarea name="${path}" id="${path}" placeholder="${placeholder}" style="max-width:90%;${style}"></textarea>
<div class="ui-icon ui-icon-arrow-4-diag" onclick="javascript:openDiv();"></div>

<script type="text/javascript" src="/scripts/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
    $(function() {
        var editor = CKEDITOR.inline('${path}');
        editor.config.toolbar = [
            ['Bold', 'Italic', 'Underline', 'TextColor', 'BGColor', 'NumberedList', 'BulletedList', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'Format', 'Font', 'FontSize', 'Table', 'Find', 'SelectAll', 'Maximize']
        ];
        editor.on('change', function(evt) {
            $('#${path}').val(evt.editor.getData().replace(/(\r\n|\n|\r)/gm, ""));
        });
    });
    function openDiv() {
        $(document.createElement('div'));
        $('<div id="divck" style="width:100%;height:100%;"></div>').appendTo('body')
                .dialog({
                    modal: true, autoOpen: true, width: '800', height: 'auto', resizable: false,
                    open: function() {
                        var remarks = $('#${path}').val();
                        CKEDITOR.replace('divck', {
                            height: 120,
                            toolbar: [
                                ['Bold', 'Italic', 'Underline', 'TextColor', 'BGColor', 'NumberedList', 'BulletedList', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'Format', 'Font', 'FontSize', 'Table']
                            ],
                            enterMode: 2, forceEnterMode: false, shiftEnterMode: 1
                        });
                        CKEDITOR.instances.divck.setData(remarks);
                    },
                    close: function() {
                        $(this).remove();
                    },
                    buttons: {
                        Save: function() {
                            var editor = CKEDITOR.instances.divck;
                            CKEDITOR.instances.${path}.setData(editor.getData().replace(/(\r\n|\n|\r)/gm, ""));
                            $(this).dialog("close");
                        },
                        Cancel: function() {
                            $(this).dialog("close");
                        }}
                });
    }
</script>