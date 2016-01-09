// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http: //coffeescript.org/

$(document).ready(function() {

  function browserTooSmall() {
		var winWidth = $(window).width();
		var winHeight = $(window).height();

		if ((winWidth < 640) && (winHeight < 480)) {
			alert("Window size too small!");
		}

	}

	browserTooSmall();

$(window).on("resize", browserTooSmall);


});