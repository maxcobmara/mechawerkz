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
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require bootstrap-datetimepicker
//= require turbolinks
//= require global
//= require_tree .

$(document).ready(function(){
	$('.dropdown-toggle').dropdown();
});

$(document).ready(function(){
$('#start_project').datepicker({
 format: "dd/mm/yyyy"
}); 
$('#end_project').datepicker({
 format: "dd/mm/yyyy"
}); 
});



$(document).ready(function(){
$('#document_date').datepicker({
 format: "dd/mm/yyyy"
}); 
$('#received_on').datepicker({
 format: "dd/mm/yyyy"
}); 
$('#date_time').datepicker({
 format: "dd/mm/yyyy"
}); 
});

$(document).ready(function(){
$('#date_birth').datepicker({
 format: "dd/mm/yyyy"
}); 
});

$(document).ready(function(){
$('#submitted_on').datepicker({
 format: "dd/mm/yyyy"
}); 
$('#approved_on').datepicker({
 format: "dd/mm/yyyy"
}); 
});

