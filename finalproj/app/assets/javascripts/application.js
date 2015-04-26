// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Sets up fades for popups, previews for questions, and tag button on question form
var readyFunc = function () {
	$('#search-button').click(function() {
		$('#search-form').fadeToggle("fast");
		//$('div#notifications, div#wrapper').fadeTo("fast", 0.4);
	});

	$('#search-close').click(function() {
		$('#search-form').fadeToggle("fast");
		//$('div#notifications, div#wrapper').fadeTo("fast", 1);
	});

	$('#notifications').fadeIn("slow");

	$('[id=question-wrapper]').hover(
		function() {
			$('#question-preview', this).fadeToggle("fast");
		},
		function() {
			$('#question-preview', this).fadeToggle("fast");
		}
	);

	$('.form-button-tags').click(function() {
		var categoryElement = $(this);
		categoryElement.toggleClass('highlighted');
		var selectElement = $('select option[value=' + categoryElement.html() + ']');
		// Toggle selection
		if (selectElement.attr('selected')) {
			selectElement.removeAttr('selected');
		} else {
			selectElement.attr('selected','selected');
		}
	});
}

$(document).ready(readyFunc);
// turbolinks doesn't always run ready, so this runs the func too
$(document).on("page:load", readyFunc);