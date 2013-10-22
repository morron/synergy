// Generated by CoffeeScript 2.0.0-beta7
void function () {
  var $parent, gameHeight, gameWidth, layer, OnResizeCalled, optimalRatio, scaleToFitX, scaleToFitY, stage, triangleBottom, triangleLeft, triangleMouseout, triangleMouseover, triangleRedraw, triangleRight, triangleTop;
  OnResizeCalled = function () {
    var gameHeight, gameWidth, optimalRatio, scaleToFitX, scaleToFitY;
    gameWidth = $('#index-triangle').parent().innerWidth();
    gameHeight = $('#index-triangle').parent().innerHeight();
    scaleToFitX = gameWidth / 1024;
    scaleToFitY = gameHeight / 768;
    optimalRatio = Math.min(scaleToFitX, scaleToFitY);
    stage.setScale(optimalRatio);
    return triangleRedraw();
  };
  $parent = $('#slide_index');
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
  gameWidth = $('#index-triangle').parent().innerWidth();
  gameHeight = $('#index-triangle').parent().innerHeight();
  scaleToFitX = gameWidth / 1e3;
  scaleToFitY = gameHeight / 700;
  optimalRatio = Math.min(scaleToFitX, scaleToFitY);
  stage = new Kinetic.Stage({
    container: 'index-triangle',
    width: $('#index-triangle').parent().innerWidth(),
    height: $('#index-triangle').parent().innerHeight(),
    scale: optimalRatio
  });
  layer = new Kinetic.Layer;
  triangleRight = new Kinetic.Polygon({
    fill: '#b4b6b7',
    stroke: 'white',
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
    this.setFill('#7f8283');
    document.body.style.cursor = 'pointer';
    return layer.draw();
  };
  triangleMouseout = function () {
    this.setFill('#b4b6b7');
    document.body.style.cursor = 'default';
    return layer.draw();
  };
  triangleBottom.on('mouseover', triangleMouseover);
  triangleBottom.on('mouseout', triangleMouseout);
  triangleBottom.on('click', function () {
    $parent.find('.slide-link.th').click();
    return this.fire('mouseout');
  });
  triangleLeft.on('mouseover', triangleMouseover);
  triangleLeft.on('mouseout', triangleMouseout);
  triangleLeft.on('click', function () {
    $parent.find('.slide-link.fo').click();
    return this.fire('mouseout');
  });
  triangleRight.on('mouseover', triangleMouseover);
  triangleRight.on('mouseout', triangleMouseout);
  triangleRight.on('click', function () {
    $parent.find('.slide-link.t').click();
    return this.fire('mouseout');
  });
  triangleTop.on('mouseover', triangleMouseover);
  triangleTop.on('mouseout', triangleMouseout);
  triangleTop.on('click', function () {
    $parent.find('.slide-link.f').click();
    return this.fire('mouseout');
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
  $parent.find('.slide-link.fo').on('mouseover', function () {
    return triangleLeft.fire('mouseover');
  });
}.call(this);
