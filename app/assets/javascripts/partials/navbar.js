document.addEventListener("turbolinks:load", function() {
  $(".button-collapse").sideNav({
    menuWidth: 250,
    edge: 'left',
    closeOnClick: true
  });

  $('.dropdown-button').dropdown();
})
