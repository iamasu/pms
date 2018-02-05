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
            label: 'Add Photos', command: pluginName, icon: CKEDITOR.plugins.getPath('myplugin') + 'upload.jpg'
        });
    }
};