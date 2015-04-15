// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).ready(function() {
	$('select#computer_make').on('change', function() {
	  $('.model_form').hide();
	  $('.model_form select').attr('disabled', true);
	  var selection = $(this).val();
	  $('#' + selection).show();
	  $('#' + selection + ' select').attr('disabled', false);
	}).change();
});

$( document ).ready(function() {
	$('#menu-btn').click( function() {
		$( '.menu' ).toggle();
	})
});