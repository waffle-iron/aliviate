$(window).resize(function(){
  if ($(window).width() <= 800 ){
	  $(".card_class").removeClass("card horizontal").addClass("card");
  }
  if ($(window).width() > 800){
	  $(".card_class").removeClass("card").addClass("card horizontal");
  }
});
