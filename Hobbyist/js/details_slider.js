$(document).ready(function(){ 
    $('.bxslider').bxSlider({ 
        minSlides: 1,
        maxSlides: 3,
        moveSlides: 1,
        slideWidth: 200,
        slideMargin: 40,
        prevText: '<i class="fas fa-chevron-left"></i>',
        nextText: '<i class="fas fa-chevron-right"></i>',
        autoControls: false,
        controls: true,
        pager: false,
    }); 
});