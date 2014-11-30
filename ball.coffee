Background = ->

Background::draw = (context) ->
  context.fillStyle = "#000"
  context.fillRect 0, 0, game.width, game.height
  return

Ball = ->
  Entity.call this
  @width = 20
  @height = 20
  @x = game.width/2 - @width
  @y = game.height/2 - @height

  @yVelocity = 5
  return

Ball:: = Object.create(Entity::)
Ball::constructor = Ball

Ball::update = ->
  Entity::update.apply(this, arguments)
  
  @yVelocity *=-1 if @y > game.height - @height || @y < 0
  return

game = new Game($('canvas')[0])
game.entities = [ new Background(), new Ball() ]

game.start()

$('canvas')[0].focus()
