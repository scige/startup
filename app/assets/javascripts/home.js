$(function(){
  $("#map-container").toggle(function(){
    $("#couponmap").slideUp(1000);
    $("#couponmap-title #tips").html("点击这里可以<b>展开</b>优惠地图");
  },function(){
    $("#couponmap").slideDown(1000);
    $("#couponmap-title #tips").html("点击这里可以<b>折叠</b>优惠地图");
  });
});

