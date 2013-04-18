jQuery(document).ready(function($) {
  $("#carousel-show").CloudCarousel({
    xPos: 480,
    yPos: 100,
    xRadius:450,
    yRadius:70,
    buttonLeft: $("#left-button"),
    buttonRight: $("#right-button"),
    titleBox: $('#da-vinci-title'),
    altBox: $('#da-vinci-alt'),
    reflHeight: 40,
    reflGap:2
    //speed:0.15,
    //autoRotate: 'right',
    //autoRotateDelay: 6000
  });
});
