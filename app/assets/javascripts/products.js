$(function(){
  var pos_x = $("#mapbox").attr("data-latitude");
  var pos_y = $("#mapbox").attr("data-longitude");
  
  var map = new BMap.Map("mapbox");
  var point = new BMap.Point(pos_x, pos_y);
  
  var marker1 = new BMap.Marker(new BMap.Point(pos_x, pos_y));
  map.addOverlay(marker1);
  
  map.centerAndZoom(point,16);
  //map.enableScrollWheelZoom();
  map.addControl(new BMap.NavigationControl({type: BMAP_NAVIGATION_CONTROL_ZOOM}));
  //map.addControl(new BMap.OverviewMapControl());
  
  $(".sendMobileButton").click(function(){
    $(".alert_mask").show(0);
    $(".alert_out").show(0);
  });
  
  $(".alert_out #cancel").click(function(){
    $(".alert_mask").hide(0);
    $(".alert_out").hide(0);
  });
});

