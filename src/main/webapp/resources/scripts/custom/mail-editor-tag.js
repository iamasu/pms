var cache = [];
function getSuggest(request, response) {
    var term = request.term;
    $.each(cache, function(i, recipient) {
        var value = recipient.value;
        if (value.indexOf(term) > -1) {
            response(recipient);
            return;
        }
    });
    $.ajax({
        url: "/mail/recipient.htm?term=" + term,
        type: 'GET',
        dataType: 'JSON',
        success: function(data) {
            $.each(data, function(i, recipient) {
                cache.push(recipient);
            });
            response(data);
        }
    });
}
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
    var $form = $('<form />', {action: '#', method: 'POST'});
    var $recipient = $('<input />', {class: 'mail-recipient', id: 'mailrecipient', name: 'mailrecipient', placeholder: 'Recipient:', type: 'text'});
    var $messageDiv = $('<div />', {class: 'error', id: 'no-recipient-select'});
    var $subject = $('<input />', {class: 'mail-subject', id: 'subject', name: 'subject', placeholder: 'Subject:', type: 'text'});
    var $mailBody = $('<textarea/>', {class: 'mail-body', id: 'posteditor', name: 'posteditor'});
    var $recipients = $('<input/>', {id: 'recipient', name: 'recipient', value: '', type: 'hidden'});
    $form.append($recipient, $messageDiv, $subject, $('<br/>'), $mailBody, $recipients);
    $('#compose-mail').click(function() {
        var editor = null;
        $('<div class="mail-editor-tag"></div>').html($form).dialog({
            dialogClass: 'DynamicDialogStyle',
            modal: true,
            position: {my: 'left', at: 'bottom'},
            buttons: {
                1: {id: 'send', text: 'SEND', click: function() {
                        var recipient = $('#recipient').val();
                        var subject = $('#subject').val();
                        if (recipient === '' || recipient === null) {
                            $('#no-recipient-select').html("<span style='color:red;'>* please enter recipient </span>");
                            return false;
                        }
                        var params = {'recipient': recipient, 'subject': subject, 'message': editor.getData()};
                        $.ajax({type: "POST", url: "/mail/u/compose/new", data: params,
                            success: function(data) {
                                $('#no-recipient-select').html(data);
                                $(this).dialog("close");
                            }
                        });
                    }
                },
                2: {id: 'draft', text: 'DRAFT', click: function() {
                        if ($('#id').val() === '0') {
                            $('#nodoc').html("<span style='color:red;'>* please select document</span>");
                            return false;
                        }
                    }, 'class': "customButton"
                }
            },
            open: function() {
                editor = CKEDITOR.replace('posteditor', {
                    on: {
                        change: function(event) {
                            $(this).val(event.editor.getData().replace(/(\r\n|\n|\r)/gm, ""));
                        }
                    },
                    toolbar: [
                        {name: 'addPhoto', items: ['addPhoto']},
                        {name: 'insert', items: ['Smiley']}
                    ],
                    uiColor: '#F4F4F4',
                    height: 160,
                    resize_minHeight: 50,
                    resize_maxHeight: 300,
                    extraPlugins: 'addPhoto',
                    toolbarLocation: 'bottom',
                    toolbarCanCollapse: false
                });
                $('#mailrecipient').tagEditor({
                    forceLowercase: false,
                    placeholder: 'Recipient',
                    initialTags: [],
                    autocomplete: {delay: 0, position: {collision: 'flip'}, source: getSuggest, minLength: 5},
                    onChange: function(field, editor, tags) {
                        $('#recipient').val(tags);
                    },
                    beforeTagSave: function(field, editor, tags, tag, val) {
                        $('#response').prepend('Tag ' + val + ' saved' + (tag ? ' over ' + tag : '') + '.');
                    },
                    beforeTagDelete: function(field, editor, tags, val) {
                        var q = confirm('Remove "' + val + '"?');
                        if (q)
                            $('#response').prepend('Tag ' + val + ' deleted.');
                        else
                            $('#response').prepend('Removal of ' + val + ' discarded.');
                        return q;
                    }
                });
            },
            close: function() {
                $(this).empty();
            },
            title: 'New Message', minHeight: 450, minWidth: 650, height: 375, width: 650
        }).dialogExtend({
            closable: true,
            maximizable: true,
            minimizable: true,
            minimizeLocation: "right",
            dblclick: "minimize"
        }).prev(".ui-dialog-titlebar").addClass("custom");
    });
});