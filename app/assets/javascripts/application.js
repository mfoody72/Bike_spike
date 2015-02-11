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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require turbolinks
//= require_tree .

//Masonry

$(function() {
  return $('#bikes').imagesLoaded(function() {
    return $('#bikes').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});




//Raty

$('#star-rating').raty({
    path: '/assets/',
    scoreName: 'comment[rating]'
  });

//Datepicker
$(".date-picker").datepicker();

$(".date-picker").on("change", function () {
    var id = $(this).attr("id");
    var val = $("label[for='" + id + "']").text();
    $("#msg").text(val + " changed");
});