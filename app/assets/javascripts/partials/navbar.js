document.addEventListener("turbolinks:load", function() {
// $(document).on("ready", function() {
  $(".button-collapse").sideNav({
    menuWidth: 200,
    edge: 'left',
    closeOnClick: true
  });

  $('.dropdown-button').dropdown();
})
