$(document).ready ->
  $(window).bind('scroll', (event) ->
    parallax()
    );

# mermar la velocidad del fondo en un 20%
parallax = ->
  scrollPosition = $(window).scrollTop()
  $('#logo').css('top',(0 - (scrollPosition * .2))+'px')