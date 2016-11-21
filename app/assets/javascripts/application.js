//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree

document.addEventListener("turbolinks:load", function() {
  $(".flash_message").fadeOut(6000)

  $('.collapsible').collapsible({
    accordion: false
  });

  $(".button-collapse").sideNav();

})
