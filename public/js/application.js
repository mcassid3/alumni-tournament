$(document).ready(function() {

  if (top.location.pathname === '/') {
    $.get("/vimeodata")
      .done(function(response){
      console.log(response)
      var obj = jQuery.parseJSON(response)
      var plays = (obj.stats.plays);
      $("#play-count").text(plays + " views");
      });
  }

});



