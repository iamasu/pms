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
<%@attribute name="workflowObj" required="true" type="org.iitkgp.ccms.workflow.WorkflowProperties" description="Class extending "%>
<%@attribute name="id" required="false"%>
<%@attribute name="multi" required="false" type="java.lang.Boolean"  description="allow multi files, default is true"%>

<c:set var="multi" value="${(empty multi) ? true : multi}" />

<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
<style>
    .__image-file-upload > input
    {
        display: none;
    }
</style>
<%-- logic specified here  --%>
<div id="__upload-files__" style="width: 400px">
    <div class="__image-file-upload" style="float: left">
        <label for="fileupload">
            <img src="/images/uploadIcon.png" height="16" width="16" style="cursor: pointer"/>
        </label>
        <input id="fileupload" type="file" name="files[]" data-url="/common/uploadFile" ${multi?'multiple':''}/>
    </div>
    <div style="margin-left: 30px ">
        <ol id="__ol__files">
            <c:forEach items="${files}" var="file" varStatus="idx" >                    
                <li id="__uf__${idx.index}">
                    <sf:hidden path="rmksFiles[${idx.index}].fileId"/>
                    <sf:hidden path="rmksFiles[${idx.index}].fileName"/>
                    <sf:hidden path="rmksFiles[${idx.index}].tmpFile"/>
                    <a href='/fileD/fileId/${file.fileId}' id="file_${idx.index}">${file.fileName}</a>
                    <span class="ui-icon ui-icon-minus" onclick="removeFile__(${files.fileId})"></span>
                </li>
            </c:forEach>
        </ol>
    </div>

    <%--
<table border="0" width="40%" >
    <!--caption><input id="fileupload" type="file" name="files[]" data-url="/common/uploadFile" ${multi?'multiple':''}></caption-->        
    <thead/>              
    <tbody align='center' id="__attachedFiles__">
        <c:if test="${not empty files}">
            <c:forEach items="${files}" var="file" varStatus="idx" >                    
                <tr id="__uf__${idx.index}">
                    <td>
                        <sf:hidden path="filesAttached[${idx.index}].fileId"/>
                        <sf:hidden path="filesAttached[${idx.index}].fileName"/>
                        <sf:hidden path="filesAttached[${idx.index}].tmpFile"/>
                        <a href='/fileD/fileId/${file.fileId}' id="file_${idx.index}">${file.fileName}</a>
                    </td>
                    <td><span class="ui-icon ui-icon-minus" onclick="removeFile__(${files.fileId})"></span></td>
                </tr>
            </c:forEach>
        </c:if>
    </tbody>
</table>
    --%>
</div>
<!--span id="progress" class="progress">
    <div class="bar" style="width: 0%;"></div>
</span-->
<script type="text/javascript">
    $(function() {
        $('#fileupload').fileupload({
            dataType: 'json',
            done: function(e, data) {
                
                $.each(data.result, function(index, file) {
                    var rc = $('#__ol__files li').length;
                    $('#__ol__files')
                            .append($('<li/>').html('<input type="hidden" name="rmksFiles[' + rc + '].tmpFile" id="_tmpFile' + rc + '"  value="' + file.tmpFile + '">' +
                                    '<input type="hidden" name="rmksFiles[' + rc + '].fileName" value="' + file.fileName + '">' +
                                    '<a href="rest/controller/get/">' + file.fileName + '</a> ' +
                                    '<span class="ui-icon ui-icon-minus" onclick="removeFile__(' + rc + ',this)"></span>'));
                            
                });
            },
            progressall: function(e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css('width', progress + '%');
            }
            //      dropZone: $('#dropzone')
        });

    });
    function removeFile__(idx,obj) {
        if ($('#_tmpFile' + idx).val() != '') {
            $('#__uf__' + idx).remove();
        } else {
            $('#__uf__' + idx).find('a').css("text-decoration", "line-through");
        }
    }
</script>    

