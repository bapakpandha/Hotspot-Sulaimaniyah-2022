$(document).ready(function(){
    $('#menu').click(function(){
        $(this).toggleClass('fa-times');
        $("#menu").html('<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 32 32"><path fill="currentColor" d="M24.879 2.879A3 3 0 1 1 29.12 7.12l-8.79 8.79a.125.125 0 0 0 0 .177l8.79 8.79a3 3 0 1 1-4.242 4.243l-8.79-8.79a.125.125 0 0 0-.177 0l-8.79 8.79a3 3 0 1 1-4.243-4.242l8.79-8.79a.125.125 0 0 0 0-.177l-8.79-8.79A3 3 0 0 1 7.12 2.878l8.79 8.79a.125.125 0 0 0 .177 0l8.79-8.79Z"/></svg>')
        $('.navbar').toggleClass('nav-toggle');
    });

    //scroll navbar sticky fluid
    $(window).on('scroll load',function(){
        $('#menu').removeClass('fa-times');
        $("#menu").html('<svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 20 20"><path fill="currentColor" fill-rule="evenodd" d="M3 5a1 1 0 0 1 1-1h12a1 1 0 1 1 0 2H4a1 1 0 0 1-1-1Zm0 5a1 1 0 0 1 1-1h12a1 1 0 1 1 0 2H4a1 1 0 0 1-1-1Zm0 5a1 1 0 0 1 1-1h12a1 1 0 1 1 0 2H4a1 1 0 0 1-1-1Z" clip-rule="evenodd"/></svg>')
        $('.navbar').removeClass('nav-toggle');

        if(window.scrollY>60){
            document.querySelector('#scroll-top').classList.add('active');
        }else{
            document.querySelector('#scroll-top').classList.remove('active');
        }

        // scroll spy
        $('section').each(function(){
            let height = $(this).height();
            let offset = $(this).offset().top - 200;
            let top = $(window).scrollTop();
            let id = $(this).attr('id');

            if(top>offset && top<offset+height){
                $('.navbar ul li a').removeClass('active');
                $('.navbar').find(`[href="#${id}"]`).addClass('active');
                
            }
        });
    });

    // smooth scrolling
    $('a[href*="#"]').on('click',function(e){
        e.preventDefault();
        $('html, body').animate({
            scrollTop : $($(this).attr('href')).offset().top,
        },500, 'linear')
    });

    //navbar mobile toogle
    $(function () {
        $("#svg_menu").click(function () {
            if ($("#menu").hasClass('svg-active')) {
                $("#menu").removeClass('svg-active');
                $("#menu").addClass('svg-cancel');
            }
            else {
                $("#menu").addClass("svg-active");
                $("#menu").removeClass('svg-cancel');
            }
        });
    });
});

var typewriter = new Typewriter(".typing-text", {
    loop: true,
    delay: 20,
    deleteSpeed: 0.01
  });
  
  function fade() {
    $('.typing-text').html("");
}

  typewriter
    .pauseFor(100)
    .typeString('"Intelektual yang sejati adalah orang yang mengajarkan dan menyampaikan ilmu yang dimilikinya"<br><figcaption>&mdash; Hz. Ustazımız, <cite>Syekh Sulaiman Hilmi Tunahan Q.S</cite>  </figcaption>')
    .pauseFor(1500)
    .deleteAll(1)
    .typeString('"Jangan lalai dan tetaplah belajar untuk menuntut ilmu karena hari-hari yang telah berlalu tidak akan kembali lagi"<br><figcaption>&mdash; Hz. Ustazımız, <cite>Syekh Sulaiman Hilmi Tunahan Q.S</cite>  </figcaption>')
    .pauseFor(1500)
    .deleteAll(1)
    .typeString('"Jangan biasakan untuk memberi perintah. Aku tidak pernah memerintah istriku walaupun hanya untuk membawakan segelas air. Memerintah sebenarnya hanyalah membunuh jiwa dari kata-kata tersebut. Menyarankan sesuatu akan lebih efektif daripada sebuah perintah. Sebagai contoh: “Anakku kan tidak merokok, ya kan?”"<br><figcaption>&mdash; Hz. Ustazımız, <cite>Syekh Sulaiman Hilmi Tunahan Q.S</cite>  </figcaption>')
    .deleteAll(1)
    .typeString()
    .start();
