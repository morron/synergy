OnResizeCalled = () ->
  wHeight = $(window).height();
  wWidth = wHeight/3*4;
  $('.slide article').css(
    width: wWidth
    height: wHeight
    marginLeft: (wWidth/2)*(-1)
  )

if !window.addEventListener
  window.attachEvent 'onresize', OnResizeCalled
else
  window.addEventListener "resize", OnResizeCalled, false

jQuery ->
  OnResizeCalled();
  $('#splashImg').splashScreen
    textLayers: [
      'img/splash-0.png'
      'img/splash-1.png'
      'img/splash-2.png'
      'img/splash-3.png'
      'img/splash-4.png'
    ]

  $('#slide_pmarketing figure').on 'mouseover', (e) ->
    $(this).find('[rel=img]').stop(true, true).fadeTo 'fast', 1
    $(this).find('figcaption').hide()
#    $(this).parents('figure').find('img').not('[rel=img]').fadeTo 'fast', 0
    e.preventDefault()

  $('#slide_pmarketing figure').on 'mouseout', (e) ->
    $(this).find('[rel=img]').fadeTo 'fast', 0
#    $(this).find('img').not('[rel=img]').stop(true,true).fadeTo 'fast', 1
    $(this).find('figcaption').show()
    e.preventDefault()

  OnResizeCalled()
  ###$('#slide_worth .slide-link span').on 'click', ->
    $(this).after('<p rel="hover">'+$(this).data('hover')+'</p>')
    $(this).hide()

  $('#slide_worth .slide-link p[rel=hover]').on 'mouseout', ->
    $(this).siblings('span').show()
    $(this).detach()###
