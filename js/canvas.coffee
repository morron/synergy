OnResizeCalled = () ->
  gameWidth = window.innerWidth
  gameHeight = window.innerHeight

  scaleToFitX = gameWidth / 1000
  scaleToFitY = gameHeight / 724

  optimalRatio = Math.min scaleToFitX, scaleToFitY

  stage.setScale(optimalRatio);
#  stage.setScaleX(scaleToFitX);
#  stage.setScaleY(scaleToFitY);

  ###currentScreenRatio = gameWidth / gameHeight
  optimalRatio = Math.min scaleToFitX, scaleToFitY

  console.log currentScreenRatio

  if currentScreenRatio >= 1.77 && currentScreenRatio <= 1.79
    console.log 'heelo'
    stage.setWidth gameWidth
    stage.setHeight gameHeight
  else
    stage.setWidth 1000 * optimalRatio
    stage.setHeight 700 * optimalRatio###

  triangleRedraw()

triangleRedraw = () ->
  layer.clear()
  triangleLeft.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, 0, stage.getHeight() ] )
  triangleBottom.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2 , 0, stage.getHeight(), stage.getWidth(), stage.getHeight() ] )
  triangleRight.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2 , stage.getWidth(), 0, stage.getWidth(), stage.getHeight() ] )
  triangleTop.setPoints( [ stage.getWidth() / 2 ,stage.getHeight() / 2, 0, 0, stage.getWidth(), 0 ] )
  layer.draw()

window.addEventListener("resize", OnResizeCalled, false)

gameWidth = window.innerWidth
gameHeight = window.innerHeight

scaleToFitX = gameWidth / 1000
scaleToFitY = gameHeight / 700

optimalRatio = Math.min scaleToFitX, scaleToFitY

stage = new Kinetic.Stage
  container: 'container'
  width: window.innerWidth
  height: window.innerHeight
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
  layer.draw()

triangleMouseout = () ->
  this.setFill('#b4b6b7')
  layer.draw()

triangleBottom.on('mouseover', triangleMouseover)
triangleBottom.on('mouseout', triangleMouseout)

triangleLeft.on('mouseover', triangleMouseover)
triangleLeft.on('mouseout', triangleMouseout)

triangleRight.on('mouseover', triangleMouseover)
triangleRight.on('mouseout', triangleMouseout)

triangleTop.on('mouseover', triangleMouseover)
triangleTop.on('mouseout', triangleMouseout)

# add the shape to the layer
layer.add(triangleRight)
layer.add(triangleBottom)
layer.add(triangleLeft)
layer.add(triangleTop)

OnResizeCalled()

# add the layer to the stage
stage.add(layer)