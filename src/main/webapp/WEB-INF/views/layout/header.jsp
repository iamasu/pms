
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="ft" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="<spring:theme code="css"/>" type="text/css" id="banSheet" />
<script type="text/javascript" src="/scripts/settings.js"></script>
<style>
    #notificationsBody .div-body td{border-width: 0px 0px 0px 0px !important;}
    #notificationsBody .div{border-width: 0px !important;}
    #bgopacity{
        position: relative;
    }
    #bgopacity:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url(<spring:theme code="background"/>);
        background-repeat: no-repeat;
        background-size: cover;
        width: 100%;
        height: 100%;
        opacity:0.6;
    }

</style>
<script type="text/javascript">
    function addTheme(theme) {
        $.ajax({type: 'GET', url: "/setting/theme.htm", data: 'theme=' + theme, success: function(response) {
                setTimeout(function() {
                    $('#banSheet').remove();
                    $('head').append('<link href="/css/themes/' + response + '.css" rel="stylesheet" id="banSheet" />');
                }, 500);

            }});
    }
    function addBGImg(theme) {
        $.ajax({type: 'GET', url: "/setting/theme.htm", data: 'theme=' + theme, success: function(response) {

            }});
    }
    function markAsRead(docId, id) {
        $.ajax({type: 'POST',
            url: "/common/markasread.htm?docId=" + docId + "&id=" + id,
            success: function() {
                $('#' + docId + id).css({'background': 'red'});
            }
        });
    }
    $(function() {
        $('#settingtab').css({'min-height': (($(window).height())) * .8});
        $(window).resize(function() {
            $('#settingtab').css({'min-height': (($(window).height())) * .8});
        });
        $("#settingLink").click(function() {
            $("#settingContainer").fadeToggle(300);
            $("#setting_count").fadeOut("slow");
            return false;
        });
        $(document).click(function() {
            $("#settingContainer").hide();
        });
        $('#selectbgimg').click(function() {
            selectBackgroundImage();
        });
        $('#selectbgimage').click(function() {
            selectBackgroundImage();
        });
    });

</script>
<div class="header">
    <div class="floatleft" style="margin-left: 0px;margin-top: 0px;color: #FFF;"></div>
    <div class="right-side" style="padding-right: 15px;">
        <ul id="nav">
            <li><a href="/home.htm">Home</a></li>
            <li id="setting_li">
                <a href="javascript:void "id="settingLink">Setting</a>
                <div id="settingContainer">
                    <div id="settingTitle">Setting</div>
                    <div id="settingBody" style="color: #333;font-weight: normal;">
                        <div class="settingFooter"><a onclick="" href="/settings/themes" style="color: #333;">Themes</a></div>
                        <div class="settingFooter"><a id="selectbgimage" style="color: #333;cursor: pointer;font-weight: normal;">Background image</a></div>
                    </div>
                </div>
            </li>
            <li><a href="/logout.htm">Logoff</a></li>
        </ul>
    </div>
</div>


