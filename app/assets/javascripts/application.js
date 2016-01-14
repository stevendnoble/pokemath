// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require scripts
//= require site
//= require pokemons
//= require math_functions
//= require jquery-readyselector

$(function() {
  new WOW().init();

    //mute video
    $(".mute").on("click", function(e) {
      e.preventDefault();
      $("video").prop("muted", !$("video").prop("muted"))
    });
    //change the font on click
    $("i.on").on("click", function() {
      if ($(this).hasClass("ion-ios-volume-high")) {
            $(this).removeClass("ion-ios-volume-high");
            $(this).addClass("ion-ios-volume-low");
      } else {
        $(this).removeClass("ion-ios-volume-low");
        $(this).addClass("ion-ios-volume-high");
      }
    });
});