<%-- 
    Document   : fileUpload
    Created on : 3 Dec, 2013, 3:37:26 PM
    Author     : srini
--%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%@tag description="Fileupload field to be within of spring form tag block" pageEncoding="UTF-8"%>

<%-- The list of normal attributes  --%>
<%@attribute name="attrName" description="attribute name" type="java.lang.String" required="true"%>
<%@attribute name="file" required="true" type="org.iitkgp.ccms.hibernateSupport.FileMetaData" description="File Meta data class"%>
<%@attribute name="id" required="false"%>

<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
<style>
    .__image-file-upload > input
    {
        display: none;
    }
</style>
<%-- logic specified here  --%>

<div class="__image-file-upload" style="float: left">
    <label for="__single_fileupload__${attrName}">
        <img src="/images/uploadIcon.png" height="16" width="16" style="cursor: pointer"/>
    </label>
    <input id="__single_fileupload__${attrName}" type="file" name="singleFiles" data-url="/common/uploadFile" />
    <input type="hidden" id="${attrName}_fileId" name="${attrName}.fileId" value="${empty file.fileId?'0':file.fileId}">
    <input type="hidden" id="${attrName}_fileName" name="${attrName}.fileName" value="${file.fileName}">
    <input type="hidden" id="${attrName}_tmpFile" name="${attrName}.tmpFile" value="${file.tmpFile}">

    <span id="__file_href_${attrName}">
        <c:if test="${file.fileId ne 0 && not empty file.fileId}">
            <a href='/common/viewfile/fileId/${file.fileId}' >${file.fileName}</a>
            <span class="ui-icon ui-icon-trash" onclick="removeSingleFile__${attrName}()" style="display: inline-block ;cursor: pointer"></span>
        </c:if>
    </span>

</div>
<script type="text/javascript">
    $(function() {
        $('#__single_fileupload__${attrName}').fileupload({
            add: function(e, data) {
                var uploadErrors = [];
                var acceptFileTypes = /(.|\/)(gif|jpe?g|png|msword|excel|pdf|document)$/i;
                if (data.originalFiles[0]['type'].length && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
                    uploadErrors.push('Not an accepted file type');
                }
                if (data.originalFiles[0]['size'].length && data.originalFiles[0]['size'] > 5000000) {
                    uploadErrors.push('Filesize is too big');
                }
                if (uploadErrors.length > 0) {
                    alert(uploadErrors.join("\n"));
                } else {
                    data.submit();
                }
            },
            dataType: 'json',
            done: function(e, data) {
                var fmd = data.result[0];
                $("#${attrName}_fileId").val(fmd.fileId);
                $("#${attrName}_fileName").val(fmd.fileName);
                $("#${attrName}_tmpFile").val(fmd.tmpFile);
                $("#__file_href_${attrName}").append(fmd.fileName  +
                        "<span class=\"ui-icon ui-icon-trash\" onclick=\"removeSingleFile__${attrName}()\" style=\"display:inline-block ;cursor: pointer\"></span>");
            },
            progressall: function(e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css('width', progress + '%');
            }
            //      dropZone: $('#dropzone')
        });
    });
    function removeSingleFile__${attrName}() {
    
        $("#__file_href_${attrName}").empty();
        $("#${attrName}_fileId").val(0);
        $("#${attrName}_fileName").val("");
        $("#${attrName}_tmpFile").val("");
        if(typeof __hook_file_delete  != "undefined"){
            __hook_file_delete('${attrName}');
        }        
    }
</script>    

