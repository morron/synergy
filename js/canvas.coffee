OnResizeCalled = () ->
  gameWidth = $('#index-triangle').parent().innerWidth()
  gameHeight = $('#index-triangle').parent().innerHeight()

  scaleToFitX = gameWidth / 1024
  scaleToFitY = gameHeight / 768

  optimalRatio = Math.min scaleToFitX, scaleToFitY

  stage.setScale(optimalRatio)

  triangleRedraw()

$parent = $ '#slide_index'

triangleRedraw = () ->
  layer.clear()
  triangleLeft.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, 0, stage.getHeight() ] )
  triangleBottom.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2 , 0, stage.getHeight(), stage.getWidth(), stage.getHeight() ] )
  triangleRight.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2 , stage.getWidth(), 0, stage.getWidth(), stage.getHeight() ] )
  triangleTop.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, stage.getWidth(), 0 ] )
  layer.draw()

window.addEventListener("resize", OnResizeCalled, false)

gameWidth = $('#index-triangle').parent().innerWidth()
gameHeight = $('#index-triangle').parent().innerHeight()

scaleToFitX = gameWidth / 1000
scaleToFitY = gameHeight / 700

optimalRatio = Math.min scaleToFitX, scaleToFitY

stage = new Kinetic.Stage
  container: 'index-triangle'
  width: $('#index-triangle').parent().innerWidth()
  height: $('#index-triangle').parent().innerHeight()
  scale: optimalRatio

layer = new Kinetic.Layer()

triangleRight = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2 , stage.getWidth(), 0, stage.getWidth(), stage.getHeight() ]

triangleBottom = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2 , 0, stage.getHeight(), stage.getWidth(), stage.getHeight() ]


triangleLeft = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, 0, stage.getHeight() ]


triangleTop = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, stage.getWidth(), 0 ]

triangleMouseover = () ->
  this.setFill('#7f8283')
  document.body.style.cursor = 'pointer'
  layer.draw()

triangleMouseout = () ->
  this.setFill('#b4b6b7')
  document.body.style.cursor = 'default'
  layer.draw()

triangleBottom.on('mouseover', triangleMouseover)
triangleBottom.on('mouseout', triangleMouseout)
triangleBottom.on 'click', ->
  $parent.find('.slide-link.th').click()
  this.fire 'mouseout'

triangleLeft.on('mouseover', triangleMouseover)
triangleLeft.on('mouseout', triangleMouseout)
triangleLeft.on 'click', ->
  $parent.find('.slide-link.fo').click()
  this.fire 'mouseout'

triangleRight.on('mouseover', triangleMouseover)
triangleRight.on('mouseout', triangleMouseout)
triangleRight.on 'click', ->
  $parent.find('.slide-link.t').click()
  this.fire 'mouseout'


triangleTop.on('mouseover', triangleMouseover)
triangleTop.on('mouseout', triangleMouseout)
triangleTop.on 'click', ->
  $parent.find('.slide-link.f').click()
  this.fire 'mouseout'


# add the shape to the layer
layer.add(triangleRight)
layer.add(triangleBottom)
layer.add(triangleLeft)
layer.add(triangleTop)

OnResizeCalled()

# add the layer to the stage
stage.add(layer)

$parent.find('.slide-link.f').on 'mouseover', ->
  triangleTop.fire 'mouseover'

$parent.find('.slide-link.t').on 'mouseover', ->
  triangleRight.fire 'mouseover'

$parent.find('.slide-link.fo').on 'mouseover', ->
  triangleLeft.fire 'mouseover'
