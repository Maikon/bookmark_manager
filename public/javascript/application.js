
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

function prepareNewLinkHandler () {
  $('.add-link, .sign-in, .sign-up').click(function(event) {
    $.get($(this).attr('href'), function(data) {
      if($('#ajax-form').length == 0){
        $('#container').prepend("<div id='ajax-form'></div>");
      }
      $('#container #ajax-form').html(data);
    });
    event.preventDefault();
  });
}

$(function(){
  prepareNewLinkHandler();
})
