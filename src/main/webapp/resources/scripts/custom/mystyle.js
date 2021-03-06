(function () {
    $('.tile').each(function () {
        var $this = $(this), page = $this.data('page-name'), bgcolor = $this.css('background-color'), textColor = $this.css('color');
        if ($this.hasClass('rotate3d')) {
            frontface = $this.find('.front');
            bgcolor = frontface.css('background-color');
            textColor = frontface.css('color');
        }
        if ($this.hasClass('fig-tile')) {
            caption = $this.find('figcaption');
            bgcolor = caption.css('background-color');
            textColor = caption.css('color');
        }
        $this.on('click', function () {
            $('.' + page).css({'background-color': bgcolor, 'color': textColor}).find('.close-button').css({'background-color': textColor, 'color': bgcolor});
        });
    });
    function showDashBoard() {
        for (var i = 1; i <= 3; i++) {
            $('.column' + i).each(function () {
                $(this).addClass('fadeInForward-' + i).removeClass('fadeOutback');
            });
        }
    }
    function fadeDashBoard() {
        for (var i = 1; i <= 3; i++) {
            $('.column' + i).addClass('fadeOutback').removeClass('fadeInForward-' + i);
        }
    }
    $('.tile').each(function () {
        var $this = $(this);
        var pageType = $this.data('page-type');
        var page = $this.data('page-name');
        $this.on('click', function () {
            if (pageType === "s-page") {
                fadeDashBoard();
                $('.' + page).addClass('slidePageInFromLeft').removeClass('slidePageBackLeft');
            } else {
                $(".page-title").html($this.data('page-title'));
                $(".page-data").html($(this).html());
                $('.' + page).addClass('slidePageInFromLeft').addClass('openpage').removeClass('slidePageBackLeft');
                fadeDashBoard();
            }
        });
    });
    $('.r-close-button').click(function () {
        $(this).parent().removeClass('slidePageInFromLeft').addClass('slidePageBackLeft');
        showDashBoard();
    });
    $('.s-close-button').click(function () {
        $(this).parent().removeClass('slidePageInFromLeft').addClass('slidePageBackLeft');
        showDashBoard();
    });
})();