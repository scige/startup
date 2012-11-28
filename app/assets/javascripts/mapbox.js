function showMapBox(){
    var mapbox = document.getElementById("mapbox");
    var pos_x = mapbox.getAttribute("data-latitude");
    var pos_y = mapbox.getAttribute("data-longitude");

    var map = new BMap.Map("mapbox");
    var point = new BMap.Point(pos_x, pos_y);
    
    var marker1 = new BMap.Marker(new BMap.Point(pos_x, pos_y));
    map.addOverlay(marker1);
    
    map.centerAndZoom(point,15);
    map.enableScrollWheelZoom();
};
