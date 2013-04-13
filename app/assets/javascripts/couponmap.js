$(function(){
  $("#couponmap-title").click(function(){
    if ($("#couponmap").is(":visible")){
      $("#couponmap").slideUp(1000);
      $("#couponmap-title #tips").html("点击这里可以<b>展开</b>优惠地图");
    }else{
      $("#couponmap").slideDown(1000);
      $("#couponmap-title #tips").html("点击这里可以<b>折叠</b>优惠地图");
    }
  });

  $("#couponmap-title").oneTime(5000, function(){
    if ($("#couponmap").is(":visible")){
      $("#couponmap").slideUp(1000);
      $("#couponmap-title #tips").html("点击这里可以<b>展开</b>优惠地图");
    }
  });

  $(".sysmsg .close").click(function(){
    $(".sysmsgw").hide(0);
  });
});

