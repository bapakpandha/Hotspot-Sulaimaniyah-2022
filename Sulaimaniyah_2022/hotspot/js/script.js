function readablizeBytes(bytes) {
    var s = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
    var e = Math.floor(Math.log(bytes) / Math.log(1024));
    return (bytes / Math.pow(1024, Math.floor(e))).toFixed(2) + " " + s[e];
}

$(window).scroll(function () {
    if ($(window).scrollTop() <= 80) {
        $('#topNav').removeClass('lg:h-full lg:rounded-3xl lg:my-4 lg:w-[95%] backdrop-blur lg:bg-shades-0/90 !text-c-blue-900');
        $('#tempat_nav').addClass('lg:bg-shades-0');
    } else {
        $('#tempat_nav').removeClass('lg:bg-shades-0');
        $('#tempat_nav').addClass('bg-transparent ');
        $('#topNav').addClass('lg:h-full lg:rounded-3xl lg:my-4 lg:w-[95%] backdrop-blur lg:bg-shades-0/90 !text-c-blue-900');
    }
});

$(function () {
    $("#tombol_nav").click(function () {
        if ($("#klik_nav").hasClass('max-h-screen')) {
            $("#klik_nav").removeClass('max-h-screen');
            $("#klik_nav").addClass('max-h-0');
        }
        else {
            $("#klik_nav").addClass("max-h-screen");
        }
    });
});

$(function () {
    $("#mobile_info").click(function () {
        if ($("#mobile_info_uicci").hasClass('max-h-screen')) {
            $("#mobile_info_uicci").removeClass('max-h-screen');
            $("#mobile_info_uicci").addClass('max-h-0');
            $("#svg_ikon").removeClass("rotate-180");
        }
        else {
            $("#mobile_info_uicci").addClass("max-h-screen");
            $("#svg_ikon").addClass("rotate-180");
        }
    });
});