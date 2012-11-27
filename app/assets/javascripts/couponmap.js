function showCouponMap(){
    var map = new BMap.Map("couponmap");

    var marker1 = new BMap.Marker(new BMap.Point(126.507328, 43.825834));
    map.addOverlay(marker1);
    var content = "<a target='_blank' href='http://www.baidu.com'>百度</a>"
    var infoWindow1 = new BMap.InfoWindow(content);
    marker1.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});

    var marker2 = new BMap.Marker(new BMap.Point(126.510998, 43.827587));
    map.addOverlay(marker2);
    var infoWindow2 = new BMap.InfoWindow("东北电力大学老校区");
    marker2.addEventListener("click", function(){this.openInfoWindow(infoWindow2);});

    var marker2 = new BMap.Marker(new BMap.Point(126.518292, 43.829964));
    map.addOverlay(marker2);
    var infoWindow2 = new BMap.InfoWindow("东北电力大学新校区");
    marker2.addEventListener("click", function(){this.openInfoWindow(infoWindow2);});
  
    var point = new BMap.Point(126.510998, 43.827587);
    map.centerAndZoom(point,16);
    // 禁止鼠标滚动，用户体验更好
    //map.enableScrollWheelZoom();
};
