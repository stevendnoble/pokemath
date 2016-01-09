// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http: //coffeescript.org/

var resizeTimer;

// Checks the size of the browser and alerts the user if
// window is too small to view
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

  // Sets the height of a tile to be the same as the width
  // to make each one a square
  function squareTile() {
    var columnHeight = $('#r0c0').width();
    $('.game-tile').height(columnHeight);
  }
  squareTile();
  browserTooSmall();

  function placeObstacle(obstacle, row, col) {
    selector = '#r' + row + 'c' + col;
    $(selector).addClass(obstacle + '-tile');
    $(selector).addClass('obstacle');
  }

  placeObstacle('obstacle1', 1, 1);
  placeObstacle('obstacle1', 4, 5);
  placeObstacle('obstacle1', 3, 8);
  placeObstacle('obstacle2', 2, 7);
  placeObstacle('obstacle2', 4, 10);
  placeObstacle('obstacle2', 3, 3);
  placeObstacle('obstacle0', 1, 3);
  placeObstacle('obstacle0', 1, 10);
  placeObstacle('obstacle0', 2, 6);
  placeObstacle('obstacle0', 4, 2);
  placeObstacle('obstacle0', 3, 7);

  $(window).on("resize", squareTile);
  $(window).on("resize", browserTooSmall);
});