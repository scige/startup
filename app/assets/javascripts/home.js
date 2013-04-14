jQuery(document).ready(function($) {
  $('#slider-show').bjqs({
    animtype    : 'slide',
    width       : 960,
    height      : 382,
    prevtext    : '‹',
    nexttext    : '›',
    showmarkers : false,
    responsive  : true
  });

  $(".sysmsg .close").click(function(){
    $(".sysmsgw").hide(0);
  });
});
