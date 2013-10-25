OnResizeCalled = () ->
  wHeight = window.innerHeight;
  wWidth = innerHeight/3*4;
  $('.slide article').css(
    width: wWidth
    height: wHeight
    marginLeft: (wWidth/2)*(-1)
  )

window.addEventListener("resize", OnResizeCalled, false)

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

  $('#slide_pmarketing figure').on 'mouseover', ->
    $(this).find('img').not('[rel=img]').stop().fadeTo 'slow', 0
    $(this).find('figcaption').hide()
    $(this).find('[rel=img]').stop().fadeTo 'slow', 1

  $('#slide_pmarketing figure').on 'mouseout', ->
    $(this).find('[rel=img]').stop().fadeTo 'fast', 0
    $(this).find('img').not('[rel=img]').stop().fadeTo 'fast', 1
    $(this).find('figcaption').show()


  ###$('#slide_worth .slide-link span').on 'click', ->
    $(this).after('<p rel="hover">'+$(this).data('hover')+'</p>')
    $(this).hide()

  $('#slide_worth .slide-link p[rel=hover]').on 'mouseout', ->
    $(this).siblings('span').show()
    $(this).detach()###
