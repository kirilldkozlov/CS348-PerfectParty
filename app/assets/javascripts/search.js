$(document).ready(function() {
  $(".search-btn").click(function(){
    var city = $(".search-text").val();
    var old_city = $("#old-val").val();

    if (city != old_city) {
      var path = (city) ? "/venues?city=" + city : "/venues";
      window.location.href = window.location.origin + path;
    }
  });
});
