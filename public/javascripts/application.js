// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
$('.project-overlay').mouseover(function(){
	$(this).find('.project_text').show();
//	$(this).find('.project_image').hide();
});
$('.project-overlay').mouseout(function(){
	$(this).find('.project_text').hide();
//	$(this).find('.project_image').hide();
});
});