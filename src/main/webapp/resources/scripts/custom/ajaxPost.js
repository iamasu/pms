function ajaxPost(message, postUrl, succesUrl) {
    $(document.createElement('div'));
    $('<div ></div>').appendTo('body')
            .html('<div style="font-weight:lighter">' + message + '</div>')
            .dialog({
                modal: true, autoOpen: true, title: 'Warning', width: '300', height: 'auto', resizable: false,
                buttons: {
                    Yes: function() {
                        $(this).dialog("close");
                        $.ajax({type: 'POST',
                            url: postUrl,
                            success: function(response) {
                                alert('Information', response);
                                if (succesUrl === null || succesUrl === '') {
                                    return false;
                                } else {
                                    window.location = succesUrl;
                                }
                            }});
                    },
                    No: function() {
                        $(this).dialog("close");
                    }
                },
                close: function(event, ui) {
                    $(this).remove();
                }
            });
}
function ajaxJSONDataPost(message, postUrl, data, succesUrl) {
    $(document.createElement('div'));
    $('<div ></div>').appendTo('body')
            .html('<div style="font-weight:lighter">' + message + '</div>')
            .dialog({
                modal: true, autoOpen: true, title: 'Warning', width: '300', height: 'auto', resizable: false,
                buttons: {
                    Yes: function() {
                        $(this).dialog("close");
                        $.ajax({type: 'POST',
                            data: data,
                            contentType: 'application/json',
                            url: postUrl,
                            success: function(response) {
                                alert('Information',response);
                                if (succesUrl === null || succesUrl === '') {
                                    return false;
                                } else {
                                    window.location = succesUrl;
                                }
                            }});
                    },
                    No: function() {
                        $(this).dialog("close");
                    }
                },
                close: function(event, ui) {
                    $(this).remove();
                }
            });
}


