
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .accordion > li > a{
        font-size: 15px;
        height: 30px;
        list-style-position:inside;
        border:1px solid #EBEBEB;
        border-left-width: 0px;
        border-right-width: 0px;
        border-bottom-width: 1px;
        margin:0px;
    }
    .accordion > li:hover > a,
    .accordion > li:target > a,
    .accordion > li > a.active {
        padding-left: 10px !important;
        text-decoration: none !important;
        color: #0087d0 !important;
        width: 100%;
        text-shadow: 1px 1px 1px rgba(255,255,255, .2);
        background: #EBEBEB;
        background: -moz-linear-gradient(top,  #FAFAFA 0%, #C2EAFF 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#C2EAFF));
        background: -webkit-linear-gradient(top,  #FAFAFA 0%,#C2EAFF 100%);
        background: -o-linear-gradient(top,  #FAFAFA 0%,#C2EAFF 100%);
        background: -ms-linear-gradient(top,  #FAFAFA 0%,#C2EAFF 100%);
        background: linear-gradient(top,  #FAFAFA 0%,#C2EAFF 100%);
    }
    .accordion > li:hover > a span,
    .accordion > li:target > a span,
    .accordion > li > a.active span {
        color: #FFFFFE !important;
        text-shadow: 0px 1px 0px rgba(0,0,0, .35);
        background: #3e5706;
    }

    .accordion li.files > a:before { background-position: 0px 0px; }
    .accordion li.files:hover > a:before,
    .accordion li.files:target > a:before,
    .accordion li.files > a.active:before { background-position: 0px -24px; }

    .accordion li.mail > a:before { background-position: -24px 0px; }
    .accordion li.mail:hover > a:before,
    .accordion li.mail:target > a:before,

    .accordion li.mail > a.active:before { background-position: -24px -24px; }
    .accordion li.cloud > a:before { background-position: -48px 0px; }
    .accordion li.cloud:hover > a:before,
    .accordion li.cloud:target > a:before,
    .accordion li.cloud > a.active:before { background-position: -48px -24px; }

    .accordion li.sign > a:before { background-position: -72px 0px; }
    .accordion li.sign:hover > a:before,
    .accordion li.sign:target > a:before,
    .accordion li.sign > a.active:before { background-position: -72px -24px; }
    .accordion li > .sub-menu {
        display: none;
        text-decoration: none !important;
        font-size: 14px;
        padding-left: 10px !important;
    }

    .accordion li:target > .sub-menu {
        display: block;
        text-decoration: none !important;
    }
    .accordion a{
        display: block !important;
        color: #2c374c !important;
        font-weight: lighter !important;
        font-size: 15px !important;
        font-family: Microsoft Sans Serif !important;
    }
</style>
<script type="text/javascript">
    $(document).ready(function() {
        var accordion_head = $('.accordion > li > a');
        var accordion_body = $('.accordion li > .sub-menu');
        $('.accordion li > .sub-menu a').each(function() {
            if ($(this).attr('href') === (window.location.pathname + window.location.search)) {
                $('.accordion li > .sub-menu').slideUp(1);
                $('#' + $(this).attr('id')).addClass('active');
                $('#' + $(this).attr('id')).next().stop(true, true).slideToggle('fast');
            }
        });
        accordion_head.on('click', function(event) {
            event.preventDefault();
            if ($(this).attr('class') !== 'active') {
                accordion_body.slideUp(1);
                $(this).next().stop(true, true).slideToggle('fast');
                accordion_head.removeClass('active');
                $(this).addClass('active');
            }
        });
    });
</script>
<div class="menuContent">
    <div>
        <a class="fa fa-inbox" href="/admin/user.htm?tab=inbox" title="Inbox (0)" style="text-decoration: none !important;font-size: 15px;padding: 5px;"> Inbox</a>
    </div>
    <div>
        <a  class="fa fa-envelope-o" href="/admin/user.htm?tab=sent" target="_top"  style="text-decoration: none !important;font-size: 15px;padding: 5px;"> Sent</a>
    </div>
</div>