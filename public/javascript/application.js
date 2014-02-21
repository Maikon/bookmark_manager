
function addFavouritesHandler() {
  $('.star.solid').click(function(event){
    var link = $(this).parent();
    var favourited = !!$(link).data('favourited');
    var newOpacity = favourited ? 0 : 1;
    $(link).data('favourited', !favourited);
    $(this).animate({opacity: newOpacity});

    showLinkFavouritedNotice(link);
  });
}

function showLinkFavouritedNotice (link) {
  var favourited = !!$(link).data('favourited');
  var name = $(link).find('.title').text();
  var message = favourited ?
                name + ' was added to favourites' :
                name + ' was removed from favourites';
  var $flash = $('<div></div>').addClass('flash-notice').html(message);
  $flash.appendTo('#flash-container');
  window.setTimeout(function(){
    $($flash).fadeOut();
  }, 1000);
}

$(function(){
  addFavouritesHandler();
});