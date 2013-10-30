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