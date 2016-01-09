// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http: //coffeescript.org/

var resizeTimer;

function browserTooSmall() {
  if (resizeTimer) {
    clearTimeout(resizeTimer);
  }
  resizeTimer = setTimeout(function() {
    var winWidth = $(window).width();
    var winHeight = $(window).height();

    if ((winWidth < 640) && (winHeight < 480)) {
      alert("Window size too small!");
    }
  }, 500);
}


$(document).ready(function() {
  var $firstBox = $('#r0c0');
  var $gameTile = $('.game-tile');

  function squareTile() {
    var columnHeight = $('#r0c0').width();
    $('.game-tile').height(columnHeight);
  }

  squareTile();
  browserTooSmall();

  $(window).on("resize", squareTile);
  $(window).on("resize", browserTooSmall);
});