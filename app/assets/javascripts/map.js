jQuery(document).ready(function($) {
  $("#carousel-show").CloudCarousel({
    xPos: 480,
    yPos: 0,
    buttonLeft: $("#left-but"),
    buttonRight: $("#right-but"),
    altBox: $("#alt-text"),
    titleBox: $("#title-text")
  });
});
