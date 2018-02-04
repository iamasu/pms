<%-- 
    Document   : timeline
    Created on : Dec 5, 2015, 10:00:07 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="/scripts/ckeditor/ckeditor.js" id="ckeditorScript"></script>
    <title>Home Page</title>
    <style type="text/css">
        .cke_bottom {display: inline-block; width: 98% !important;}
        .cke_toolgroup{margin:0 2px 1px 0 !important;border:0px !important;}
        .cke_top{padding:2px 0px 0px !important;background-image: -webkit-linear-gradient(top,#EDEDED,#DBDBDB)!important;}
        .cke_combo_text {line-height: 22px !important;padding-left: 4px !important;}
        .cke_combo_button {
            margin: 0 0px 1px 0 !important;
            border:1px inset #DADADA!important;
            border-top: 0px !important;
            border-radius: 0px !important;
            background-image: -webkit-linear-gradient(top,#EDEDED,#DBDBDB)!important;
        }
        a.cke_button {height: 15px !important;}
        .cke_combo_text { max-width: fit-content !important; }
    </style>
    <script type="text/javascript">
        $(function() {
            CKEDITOR.plugins.registered['addPhoto'] = {
                init: function(editor) {
                    var pluginName = 'addPhoto';
                    editor.addCommand(pluginName, {
                        modes: {wysiwyg: 1, source: 1},
                        exec: function(editor) {
                            $('#mailAttachmentId').remove();
                            var mailAttachment = document.createElement("input");
                            mailAttachment.type = "file";
                            mailAttachment.id = "mailAttachmentId";
                            mailAttachment.style.overflow = "hidden";
                            mailAttachment.style.width = "1px";
                            mailAttachment.style.height = "1px";
                            mailAttachment.style.opacity = 0.01;
                            mailAttachment.position = "absolute";
                            mailAttachment.zIndex = 1E3;
                            document.body.appendChild(mailAttachment).click();
                            mailAttachment.addEventListener("change", function() {
                                var a = mailAttachment.files.length;
                                if (a) {
                                    for (var b = 0; b < a; b++) {
                                        var c = mailAttachment.files[b];
                                        var formData = new FormData();
                                        formData.append('file', c);
                                        formData.append("refId", 0);
                                        var i = new XMLHttpRequest;
                                        i.open("POST", '/photo/uploads.htm');
                                        i.onload = function() {
                                            if (i.status !== 200) {
                                                i.status === 413 ? alert('fileTooBig') : alert("Error posting the file to " + c.url + "\r\nResponse status: " + i.status);
                                                window.console && console.log(i);
                                            } else {
                                                var file = JSON.parse(i.responseText);
                                                d = new CKEDITOR.dom.element("img", editor.document);
                                                d.setText(file.name);
                                                d.setAttribute("src", "/imgguru/photos.htm?id=" + file.id);
                                                d.setAttribute("width", 240);
                                                d.setAttribute("height", 160);
                                                editor.insertElement(d);
                                            }
                                        };
                                        i.onerror = function(a) {
                                            alert("Error posting the file to " + c.url);
                                            window.console && console.log(a);
                                            (a = b.document.getById(c.id)) && (c.originalNode ? a.$.parentNode.replaceChild(c.originalNode, a.$) : a.remove());
                                            b.fire("updateSnapshot");
                                        };
                                        i.onabort = function() {
                                            if (c.callback)
                                                c.callback.upload(null);
                                            else {
                                                var a = b.document.getById(c.id);
                                                a && (c.originalNode ? a.$.parentNode.replaceChild(c.originalNode, a.$) : a.remove());
                                            }
                                        };
                                        i.send(formData);
                                    }
                                }
                            });
                        }
                    });
                    editor.ui.addButton('addPhoto', {
                        label: 'Add Photos', command: pluginName, icon: CKEDITOR.plugins.getPath('myplugin') + 'upload.png'
                    });
                }
            };
            CKEDITOR.plugins.registered['save'] = {
                init: function(editor) {
                    editor.addCommand('save', {
                        modes: {wysiwyg: 1, source: 1},
                        exec: function(editor) {
                            var params = {post: editor.getData(), privacy: 0};
                            $.ajax({type: "POST", url: "timeline/post.htm", data: params,
                                success: function(data, textStatus, jqXHR) {
                                    editor.setData("");
                                }
                            });
                        }
                    });
                    editor.ui.addButton('Save', {label: 'Send', command: 'save'});
                }
            };
            CKEDITOR.disableAutoInline = true;
            CKEDITOR.replace('posteditor', {
                on: {
                    change: function(event) {
                        $(this).val(event.editor.getData().replace(/(\r\n|\n|\r)/gm, ""));
                    }
                },
                toolbar: [
                    {name: 'addPhoto', items: ['addPhoto']},
                    {name: 'insert', items: ['Smiley']},
                    {name: 'document', items: ['Save']}
                ],
                extraPlugins: 'addPhoto',
                toolbarLocation: 'bottom',
                toolbarCanCollapse: false
            });
            CKEDITOR.replaceAll();
        });
        $(function() {
            $(".like-timeline").click(function() {
                var id = $(this).attr("data-url");
                if ($(this).hasClass('like-me') == true) {
                    $(this).removeClass('like-me');
                } else {
                    $(this).addClass('like-me');
                }
            });
            $(".comment-timeline").click(function() {
                var id = $(this).attr("data-url");
                var $curr = $("li.timeline-comment");
                $curr.css("background", "#f99");
                $curr = $curr.next();
                $("li").css("background", "#FAFAFA");
                $curr.css("background", "#RED");
                if ($("#editor-" + id).length == 0) {
                    var config = {};
//                        $('textarea').attr({id: 'editor-' + id, class: 'editor'}).appendChild($elem);
//                        var comment = document.createElement("li");
//                        comment.id = "editor-" + id;
//                        CKEDITOR.appendTo(comment, config, "");
                }
            });
        });
    </script>
</head>
<body>   
    <div class="post" style="padding-bottom: 10px;min-height: 100px;">
        <div>What's your mind?</div>
        <div>
            <form>
                <textarea style="display: none" id="posteditor"></textarea>
            </form>
        </div>
    </div>
    <table style="text-align: left;width: 100%;" class="timelines">${timeLine}
        <c:forEach items="${timeline}" var="t">
            <tr>
                <td class="timeline-comment">
                    <a href="/profile.htm?id=${t.user.id}">
                        <div style="float: left;">
                            <span><img width="40" height="35" src="/userphoto.htm?userId=${t.user.id}"></span>
                            <br>${t.user.firstName}
                        </div>
                    </a>
                    <table style="width: 90%;">
                        <tr>
                            <td style="padding-left: 20px;width: 100%;">${t.post}</td>
                        </tr>
                        <tr>
                            <td class="comment-like-share" style="padding-left: 50px;width: 100%;">
                                <div data-url='${t.id}' style="float: left;margin-right: 10px;cursor: pointer;" class="like-timeline like-me">Like</div>
                                <div data-url='${t.id}' style="float: left;margin-right: 10px;cursor: pointer;" class="comment-timeline">Comment</div>
                                <div data-url='${t.id}' style="float: left;cursor: pointer;" class="share-timeline">Share</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <div style="float: left;"><img width="40" height="35" src="/userphoto.htm?userId=${t.user.id}"></div>
                                    <div style="float: left;"><form><textarea class="ckeditor" id="editor"></textarea></form></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
