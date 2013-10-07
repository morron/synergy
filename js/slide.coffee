jQuery ->

  parallax.add($("#slide_index"))
  .add($("#slide_agency"))
  .add($("#slide_services"))
  .add($('#slide_mission'))
  .add($('#slide_budda'))
  .add($('#slide_worth'))

  parallax.background = $("body")

  $('.slide-link, .button').on 'click', ->
    parallax.speed = 2000
    parallax.easing = 'easeInOutQuint'
    parallax.scaling = 0.15

    slide = 'slide_'+$(this).attr('data-slide')
    direction = $(this).attr('data-direction')
    parallax[slide].top() if direction is 'top'
    parallax[slide].bottom() if direction is 'bottom'
    parallax[slide].left() if direction is 'left'
    parallax[slide].right() if direction is 'right'

  parallax.slide_index.show()

###

  # инициализация Stellar.js
  $(window).stellar
    # Set scrolling to be in either one or both directions
    horizontalScrolling: true
    verticalScrolling: true

    parallaxBackgrounds: true
    parallaxElements: true

    verticalOffset: 0
    horizontalOffset: 0

    hideDistantElements: true

  # Кэш некоторых переменных
  links = $('.slide-link, .slide-block')
  slide = $('.slide')
  button = $('.button')
  mywindow = $(window)
  htmlbody = $('html,body')

  # Установка плагина waypoints
  slide.waypoint (event, direction) ->

    # кэш переменной параметра data-slide
    dataslide = $(this).attr('data-slide')

    # Если пользователи переходят вверх по сайту, то изменять внешний вид навигации
    if direction == 'down'
      $('.navigation li[data-slide="' + dataslide + '"]').addClass('active').prev().removeClass('active')
    # else Если пользователи переходят вниз по сайту, то изменять внешний вид навигации and
    else
      $('.navigation li[data-slide="' + dataslide + '"]').addClass('active').next().removeClass('active')


  # Отменяем waypoints для первого слайда
  mywindow.scroll () ->
    if mywindow.scrollTop() == 0
      $('.navigation li[data-slide="1"]').addClass('active')
      $('.navigation li[data-slide="2"]').removeClass('active')


  # Анимация перехода между слайдами
  goToByScroll = (dataslide, orientation) ->
    if orientation == 'vertical'
      htmlbody.animate({
        scrollTop: $('.slide[data-slide="' + dataslide + '"]').offset().top
      }, 2000, 'easeInOutQuint')
    else if orientation == 'horizontal'
      htmlbody.animate({
        scrollLeft: $('.slide[data-slide="' + dataslide + '"]').offset().left
      }, 2000, 'easeInOutQuint')

  # Когда пользователь нажимает на ссылку в навигации, получаем значение параметра data-slide слайда и передаем его функции goToByScroll
  links.click (e) ->
    e.preventDefault()
    dataslide = $(this).attr('data-slide')
    orientation = $(this).attr('data-orientation') || 'horizontal'
    goToByScroll(dataslide, orientation)
    return false

  # Когда пользователь нажимает на кнопку перехода, получаем значение параметра data-slide кнопки и передаем его функции goToByScroll
  button.click (e) ->
    e.preventDefault()
    dataslide = $(this).attr('data-slide')
    orientation = $(this).attr('data-orientation') || 'horizontal'
    goToByScroll(dataslide, orientation)
###
