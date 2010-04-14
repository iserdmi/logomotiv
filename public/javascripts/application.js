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

$(window).resize(function() { //min-width = 948 //second=1106 //last= 1276
//	$(".head").html($(window).width());
	if($(window).width() > 1300) {
		$(".gallery_small").width(1276);
	} else if($(window).width() > 1100) {
		$(".gallery_small").width(1106);
	} else {
		$(".gallery_small").width(948);
	}
//	$('.arrow_right')
});
