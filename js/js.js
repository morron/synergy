// Generated by CoffeeScript 2.0.0-beta7
jQuery(function () {
  $('#splashImg').splashScreen({
    textLayers: [
      'img/splash-0.png',
      'img/splash-1.png',
      'img/splash-2.png',
      'img/splash-3.png',
      'img/splash-4.png'
    ]
  });
  $('#slide_pmarketing figure').on('mouseover', function () {
    $(this).find('img').not('[rel=img]').stop().fadeTo('slow', 0);
    $(this).find('figcaption').hide();
    return $(this).find('[rel=img]').stop().fadeTo('slow', 1);
  });
  return $('#slide_pmarketing figure').on('mouseout', function () {
    $(this).find('[rel=img]').stop().fadeTo('fast', 0);
    $(this).find('img').not('[rel=img]').stop().fadeTo('fast', 1);
    return $(this).find('figcaption').show();
  });
});
