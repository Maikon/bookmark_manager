
function addFavouritesHandler() {
  $('.star.solid').click(function(){
    $(this).animate({opacity: 1});
  });
}

$(function(){
  addFavouritesHandler();
})

