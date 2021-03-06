// Generated by CoffeeScript 2.0.0-beta7
void function () {
  var $parent, gameHeight, gameWidth, layer, OnResizeCalled, optimalRatio, scaleToFitX, scaleToFitY, stage, triangleBottom, triangleLeft, triangleMouseout, triangleMouseover, triangleRedraw, triangleRight, triangleTop;
  OnResizeCalled = function () {
    var gameHeight, gameWidth;
    gameWidth = parseFloat($('#clock-triangle').parents('article').css('width'));
    gameHeight = parseFloat($('#clock-triangle').parents('article').css('height'));
    gameWidth = gameWidth - parseFloat($('#clock-triangle').parents('.wrapper').css('paddingLeft')) - parseFloat($('#clock-triangle').parents('.wrapper').css('paddingRight'));
    gameHeight = gameHeight - parseFloat($('#clock-triangle').parents('.wrapper').css('paddingTop')) - parseFloat($('#clock-triangle').parents('.wrapper').css('paddingBottom'));
    stage.setWidth(gameWidth);
    stage.setHeight(gameHeight);
    return triangleRedraw();
  };
  $parent = $('#slide_worth');
  triangleRedraw = function () {
    layer.clear();
    triangleLeft.setPoints([
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      0,
      0,
      0,
      stage.getHeight()
    ]);
    triangleBottom.setPoints([
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      0,
      stage.getHeight(),
      stage.getWidth(),
      stage.getHeight()
    ]);
    triangleRight.setPoints([
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      stage.getWidth(),
      0,
      stage.getWidth(),
      stage.getHeight()
    ]);
    triangleTop.setPoints([
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      0,
      0,
      stage.getWidth(),
      0
    ]);
    return layer.draw();
  };
  window.addEventListener('resize', OnResizeCalled, false);
  gameWidth = $('#clock-triangle').parent().innerWidth();
  gameHeight = $('#clock-triangle').parent().innerHeight();
  scaleToFitX = gameWidth / 1e3;
  scaleToFitY = gameHeight / 700;
  optimalRatio = Math.min(scaleToFitX, scaleToFitY);
  stage = new Kinetic.Stage({
    container: 'clock-triangle',
    width: $('#clock-triangle').parent().innerWidth(),
    height: $('#clock-triangle').parent().innerHeight(),
    scale: optimalRatio
  });
  layer = new Kinetic.Layer;
  triangleRight = new Kinetic.Polygon({
    fill: '#b4b6b7',
    stroke: 'white',
    opacity: .3,
    strokeWidth: 1,
    points: [
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      stage.getWidth(),
      0,
      stage.getWidth(),
      stage.getHeight()
    ]
  });
  triangleBottom = new Kinetic.Polygon({
    fill: '#b4b6b7',
    stroke: 'white',
    opacity: .3,
    strokeWidth: 1,
    points: [
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      0,
      stage.getHeight(),
      stage.getWidth(),
      stage.getHeight()
    ]
  });
  triangleLeft = new Kinetic.Polygon({
    fill: '#b4b6b7',
    stroke: 'white',
    opacity: .3,
    strokeWidth: 1,
    points: [
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      0,
      0,
      0,
      stage.getHeight()
    ]
  });
  triangleTop = new Kinetic.Polygon({
    fill: '#b4b6b7',
    stroke: 'white',
    opacity: .3,
    strokeWidth: 1,
    points: [
      stage.getWidth() / 2,
      stage.getHeight() / 2,
      0,
      0,
      stage.getWidth(),
      0
    ]
  });
  triangleMouseover = function () {
    this.setFill('#73157C');
    this.setOpacity('0.8');
    document.body.style.cursor = 'pointer';
    return layer.draw();
  };
  triangleMouseout = function () {
    this.setFill('#b4b6b7');
    this.setOpacity('0.3');
    document.body.style.cursor = 'default';
    return layer.draw();
  };
  triangleBottom.on('mouseover', triangleMouseover);
  triangleBottom.on('mouseout', triangleMouseout);
  triangleBottom.on('mouseover', function () {
    $parent.find('.slide-link.th span').hide();
    return $parent.find('.slide-link.th p[rel=hover]').show();
  });
  triangleBottom.on('mouseout', function () {
    $parent.find('.slide-link.th span').show();
    return $parent.find('.slide-link.th p[rel=hover]').hide();
  });
  triangleLeft.on('mouseover', triangleMouseover);
  triangleLeft.on('mouseout', triangleMouseout);
  triangleLeft.on('mouseover', function () {
    $parent.find('.slide-link.fo span').hide();
    return $parent.find('.slide-link.fo p[rel=hover]').show();
  });
  triangleLeft.on('mouseout', function () {
    $parent.find('.slide-link.fo span').show();
    return $parent.find('.slide-link.fo p[rel=hover]').hide();
  });
  triangleRight.on('mouseover', triangleMouseover);
  triangleRight.on('mouseout', triangleMouseout);
  triangleRight.on('mouseover', function () {
    $parent.find('.slide-link.t span').hide();
    return $parent.find('.slide-link.t p[rel=hover]').show();
  });
  triangleRight.on('mouseout', function () {
    $parent.find('.slide-link.t span').show();
    return $parent.find('.slide-link.t p[rel=hover]').hide();
  });
  triangleTop.on('mouseover', triangleMouseover);
  triangleTop.on('mouseout', triangleMouseout);
  triangleTop.on('mouseover', function () {
    $parent.find('.slide-link.f span').hide();
    return $parent.find('.slide-link.f p[rel=hover]').show();
  });
  triangleTop.on('mouseout', function () {
    $parent.find('.slide-link.f span').show();
    return $parent.find('.slide-link.f p[rel=hover]').hide();
  });
  layer.add(triangleRight);
  layer.add(triangleBottom);
  layer.add(triangleLeft);
  layer.add(triangleTop);
  OnResizeCalled();
  stage.add(layer);
  $parent.find('.slide-link.f').on('mouseover', function () {
    return triangleTop.fire('mouseover');
  });
  $parent.find('.slide-link.t').on('mouseover', function () {
    return triangleRight.fire('mouseover');
  });
  $parent.find('.slide-link.th').on('mouseover', function () {
    return triangleBottom.fire('mouseover');
  });
  $parent.find('.slide-link.fo').on('mouseover', function () {
    return triangleLeft.fire('mouseover');
  });
}.call(this);
