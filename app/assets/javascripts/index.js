//=require bootstrap
//= require jquery
//= require rails-ujs
/*global $*/
window.onload = function(){
  alert('js!');
}

$('.image_slider').slick();

$(function() {
    $('.hoge').slick({
        dots: true,
    });
});
