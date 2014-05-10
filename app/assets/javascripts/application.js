// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require users
//= require items


$(function () {
  // Sorting and pagination links.
  $('#items th a, #items .pagination a').on('click', 
  	function () {
  		$.getScript(this.href);
  		return false;
  	});
  
  $('#items_search input').keyup(function () {
  	$.get($('#items_search').attr('action'),
  		$('#items_search').serialize(), null, 'script');
  	return false;
  });
});