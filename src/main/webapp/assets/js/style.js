$(document).ready(function(){
    // 메뉴

    $(document).on('scroll',function() {
        var position = $(document).scrollLeft();
        $(".navbar-custom").animate({left:-position},0);
    });
    $(document).on('scroll',function() {
        var position = $(document).scrollLeft();
        $(".top-menu-list-sub-wrap").animate({left:-position},0);
    });
    $(".navbar-custom .top-menu-list-wrap").on('mouseenter',function(){
        var el = $(this).siblings('.top-menu-list-sub-wrap'),
            listHeight = el.height(),
            autoHeight = el.css('height', 'auto').height();
        el.height(listHeight).animate({height: autoHeight}, 500);
    });
    $(".content-page").on('mouseenter',function(){
        $(".top-menu-list-sub-wrap").animate({height:"0"},500);
    });

    $(".btn-choice").on('click',function(){
        var choiceBg = $(this).parent().parent();
        choiceBg.siblings().css('backgroundColor','#fff');
        choiceBg.css('backgroundColor','#eee');
    });

    
});
window.onload = function() {
    $(document).scrollLeft(0);
}

