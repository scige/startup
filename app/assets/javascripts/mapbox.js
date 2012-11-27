function showMapBox(){
    var mapbox = document.getElementById("mapbox");
    var pos_x = mapbox.getAttribute("data-latitude");
    var pos_y = mapbox.getAttribute("data-longitude");

    var map = new BMap.Map("mapbox");
    var point = new BMap.Point(pos_x, pos_y);
    
    var infoWindow1 = new BMap.InfoWindow(title);
    marker1.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});
    
    map.centerAndZoom(point,15);
    map.enableScrollWheelZoom();
};
