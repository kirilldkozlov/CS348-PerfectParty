var page_functions = function() {
  var selector = '#star-'+ $("#old-val").val();
  $(selector).click();

  $(".search-btn").click(function(){
    var city = $(".search-text").val();
    var old_city = $("#old-val").val();

    if (city != old_city) {
      var path = (city) ? "/venues?city=" + city : "/venues";
      window.location.href = window.location.origin + path;
    }
  });

  $('#reset-supplier').click(function() {
      window.location.href = window.location.origin + "/suppliers";
  });

  $('.modal-review__rating-order-wrap > span').click(function() {
    $(this).addClass('active').siblings().removeClass('active');

    var data = $(this).data('rating-value');
    var old_data = $("#old-val").val();
    $(this).parent().attr('data-rating-value', data);

    if (data != old_data) {
      var path = (data) ? "/suppliers?rating=" + data : "/suppliers";
      window.location.href = window.location.origin + path;
    }

    $("#old-val").val(data);
  });
};

$(document).ready(page_functions);

$(window).on('load', (page_functions));

document.addEventListener("turbolinks:load", page_functions);
