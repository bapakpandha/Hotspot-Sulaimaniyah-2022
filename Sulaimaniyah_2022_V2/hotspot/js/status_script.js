function readablizeBytes(bytes) {
    var s = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
    var e = Math.floor(Math.log(bytes) / Math.log(1024));
    return (bytes / Math.pow(1024, Math.floor(e))).toFixed(2) + " " + s[e];
}

$(window).scroll(function () {
    if ($(window).scrollTop() <= 80) {
        $('#topNav').removeClass('wrapper_navigasi_scrolled');
        $('#tempat_nav').addClass('navigasi');
    } else {
        $('#tempat_nav').removeClass('navigasi');
        $('#tempat_nav').addClass('navigasi_scrolled');
        $('#topNav').addClass('wrapper_navigasi_scrolled');
    }
});

$(function () {
    $("#tombol_nav").click(function () {
        if ($("#expanded_nav").hasClass('max-h-screen')) {
            $("#expanded_nav").removeClass('max-h-screen');
            $("#expanded_nav").addClass('max-h-0');
        }
        else {
            $("#expanded_nav").addClass("max-h-screen");
            $("#expanded_nav").removeClass('max-h-0');
        }
    });
});

$(function () {
    $("#info_uicci_expandable").click(function () {
        if ($("#expanded_info_uicci").hasClass('max-h-screen')) {
            $("#expanded_info_uicci").removeClass('max-h-screen');
            $("#expanded_info_uicci").addClass('max-h-0');
            $("#logo_expand_info_uicci").removeClass("rotate-180");
        }
        else {
            $("#expanded_info_uicci").addClass("max-h-screen");
            $("#expanded_info_uicci").removeClass("max-h-0");
            $("#logo_expand_info_uicci").addClass("rotate-180");
        }
    });
});