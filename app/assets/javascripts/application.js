//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree

document.addEventListener("turbolinks:load", function() {
  Materialize.updateTextFields();
  $(".flash_message").fadeOut(6000)

  $('.collapsible').collapsible({
    accordion: false
  });

  $(".button-collapse").sideNav();

  var simplemde = new SimpleMDE({ element: document.getElementById("content") });

})
