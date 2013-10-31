jQuery ->
  $('#slide_index .slide-link.f').hover(
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle-f.png)'
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle.png)'
  )

  $('#slide_index .slide-link.t').hover(
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle-t.png)'
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle.png)'
  )

  $('#slide_index .slide-link.th').hover(
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle-th.png)'
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle.png)'
  )

  $('#slide_index .slide-link.fo').hover(
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle-fo.png)'
    ->
      $(this).parents('.content').css 'background-image', 'url(img/index-triangle.png)'
  )

  $('#slide_worth .slide-link.f').hover(
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle-f.png)'
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle.png)'
  )

  $('#slide_worth .slide-link.t').hover(
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle-t.png)'
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle.png)'
  )

  $('#slide_worth .slide-link.t').hover(
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle-t.png)'
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle.png)'
  )

  $('#slide_worth .slide-link.th').hover(
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle-th.png)'
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle.png)'
  )

  $('#slide_worth .slide-link.fo').hover(
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle-fo.png)'
    ->
      $(this).parents('.iec').css 'background-image', 'url(img/clock-triangle.png)'
  )

  $('#slide_worth .slide-link').hover(
    ->
      $(this).find('span').hide()
      $(this).find('p[rel=hover]').show()
    ->
      $(this).find('span').show()
      $(this).find('p[rel=hover]').hide()
  )