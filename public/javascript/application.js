
function addFavouritesHandler() {
  $('.star.solid').click(function(event){
    var newOpacity = 1 - parseInt($(this).css('opacity'));
    $(this).animate({opacity: newOpacity});
  });
}

$(function(){
  addFavouritesHandler();
})
