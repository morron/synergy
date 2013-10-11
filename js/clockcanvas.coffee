OnResizeCalled = () ->
  gameWidth = $('#clock-triangle').parent().innerWidth()
  gameHeight = $('#clock-triangle').parent().innerHeight()

  scaleToFitX = gameWidth / 1000
  scaleToFitY = gameHeight / 700

  optimalRatio = Math.min scaleToFitX, scaleToFitY

  stage.setScale(optimalRatio)

  triangleRedraw()

triangleRedraw = () ->
  layer.clear()
  triangleLeft.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, 0, stage.getHeight() ] )
  triangleBottom.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2 , 0, stage.getHeight(), stage.getWidth(), stage.getHeight() ] )
  triangleRight.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2 , stage.getWidth(), 0, stage.getWidth(), stage.getHeight() ] )
  triangleTop.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, stage.getWidth(), 0 ] )
  layer.draw()

window.addEventListener("resize", OnResizeCalled, false)

$parent = $ '#slide_worth'

gameWidth = $('#clock-triangle').parent().innerWidth()
gameHeight = $('#clock-triangle').parent().innerHeight()

scaleToFitX = gameWidth / 1000
scaleToFitY = gameHeight / 700

optimalRatio = Math.min scaleToFitX, scaleToFitY

stage = new Kinetic.Stage
  container: 'clock-triangle'
  width: $('#clock-triangle').parent().innerWidth()
  height: $('#clock-triangle').parent().innerHeight()
  scale: optimalRatio

layer = new Kinetic.Layer()

triangleRight = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  opacity: 0.3
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2 , stage.getWidth(), 0, stage.getWidth(), stage.getHeight() ]

triangleBottom = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  opacity: 0.3
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2 , 0, stage.getHeight(), stage.getWidth(), stage.getHeight() ]


triangleLeft = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  opacity: 0.3
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, 0, stage.getHeight() ]


triangleTop = new Kinetic.Polygon
  fill: '#b4b6b7'
  stroke: 'white'
  opacity: 0.3
  strokeWidth: 1
  points : [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, stage.getWidth(), 0 ]

triangleMouseover = () ->
  this.setFill('#73157C')
  this.setOpacity('0.8')
  document.body.style.cursor = 'pointer'
  layer.draw()

triangleMouseout = () ->
  this.setFill('#b4b6b7')
  this.setOpacity('0.3')
  document.body.style.cursor = 'default'
  layer.draw()

triangleBottom.on('mouseover', triangleMouseover)
triangleBottom.on('mouseout', triangleMouseout)
triangleBottom.on 'mouseover', ->
  $parent.find('.slide-link.th span').mouseover()


triangleLeft.on('mouseover', triangleMouseover)
triangleLeft.on('mouseout', triangleMouseout)
###triangleLeft.on 'mouseover', ->
  $parent.find('.slide-link.fo').mouseover()###


triangleRight.on('mouseover', triangleMouseover)
triangleRight.on('mouseout', triangleMouseout)
###triangleRight.on 'mouseover', ->
  $parent.find('.slide-link.t').mouseover()###


triangleTop.on('mouseover', triangleMouseover)
triangleTop.on('mouseout', triangleMouseout)
###triangleTop.on 'mouseover', ->
  $parent.find('.slide-link.f').mouseover()
triangleTop.on 'mouseout', ->
  $parent.find('.slide-link.f').mouseout()###


# add the shape to the layer
layer.add(triangleRight)
layer.add(triangleBottom)
layer.add(triangleLeft)
layer.add(triangleTop)

OnResizeCalled()

# add the layer to the stage
stage.add(layer)

$parent.find('.slide-link.f').on 'mouseover', ->
  triangleTop.fire('mouseover')

$parent.find('.slide-link.t').on 'mouseover', ->
  triangleRight.fire('mouseover')

$parent.find('.slide-link.th').on 'mouseover', ->
  triangleBottom.fire('mouseover')

$parent.find('.slide-link.fo').on 'mouseover', ->
  triangleLeft.fire('mouseover')

