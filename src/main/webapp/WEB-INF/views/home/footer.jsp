 
<script type="text/javascript" src="/scripts/jquery.min.js"></script>
<script type="text/javascript" src="/scripts/custom/index.js"></script>
<script type="text/javascript">
    function setHeight() {
        windowHeight = $(window).innerHeight() * .91;
        $('.sidebar').css({"max-height": windowHeight + "px", "min-height": windowHeight + "px"});
        $('.bodyContent').css({"min-height": windowHeight + "px", "overflow-y": "auto"});
        $('.content-wrapper').css({"min-height": ($('.bodyContent').height() * .85) + "px"});
        $('.ui-tabs .ui-tabs-nav').css({"width": ($('.bodyContent').innerWidth() - 225.5) + "px"});
        if ($(window).innerWidth() < 768) {
            $('#navigation').css({'padding-left': '0px'});
        } else {
            $('#navigation').css({'padding-left': '210px'});
        }
    }
    $(function() {
        if (window.addEventListener) {
            window.addEventListener("resize", setHeight);
            window.addEventListener("load", setHeight);
        } else {
            window.attachEvent('onload', setHeight);
            window.attachEvent('onunload', setHeight);
        }
        $(".hasDatepicker").click(function() {
            var $this = $(this);
            if (!$this.data('datepicker')) {
                $this.removeClass("hasDatepicker");
                $this.datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeYear: true,
                    changeMonth: true
                });
                $this.datepicker("show");
            }
        });
        $(window).bind('resize', function() {
            var innerWidth = $(window).innerWidth();
            innerWidth = innerWidth > 767 ? (innerWidth - 230) : innerWidth;
            $.each($('.ui-jqgrid-btable'), function() {
                var grid = $(this).attr('id');
                if (grid !== 'undefined' || grid !== undefined) {
                    $("#" + grid).setGridWidth(innerWidth);
                    $('.ui-tabs-nav').css({'width': innerWidth + "px"});
                }
            });
        }).trigger('resize');
        console.log('is DevTools open?', window.devtools.open);
        // check it's orientation, null if not open
        console.log('and DevTools orientation?', window.devtools.orientation);
        // get notified when it's opened/closed or orientation changes
        window.addEventListener('devtoolschange', function(e) {
            document.title = "security risk!";
            setInterval(function() {
//                window.location = '/logout.htm';
            }, 5 * 1000);
            console.log('is DevTools open?', e.detail.open);
            console.log('and DevTools orientation?', e.detail.orientation);
        });

    });
    $(window).bind("load", function() {
        var footerHeight = 0;
        var footerTop = 0;
        var $footer = $(".footer");
        positionFooter();
        function positionFooter() {
            footerHeight = $footer.height();
            footerTop = ($(window).scrollTop() + $(window).height() - footerHeight) + "px";
            if (($(document.body).height() + footerHeight) < $(window).height()) {
                $footer.css({
                    'position': "absolute",
                    'top': footerTop
                });
            }
        }
        $(window).scroll(positionFooter).resize(positionFooter);
    });
</script>
<div id="footer">
    <div id="login">
    </div>
    <br class="clear" />
</div> 
