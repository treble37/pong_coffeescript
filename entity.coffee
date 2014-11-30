Entity = ->
  @x = 0
  @y = 0

  @width = 0
  @height = 0

  @xVelocity = 0
  @yVelocity = 0

  
Entity::update = ->
  @x += @xVelocity
  @y += @yVelocity

Entity::draw = (context) ->
  context.fillStyle = "#fff"
  context.fillRect @x, @y, @width, @height
  return

Entity::intersect = (other) ->
  return @y + @height > other.y and
         @y < other.y + other.height and
         @x + @width > other.x and
         @x < other.x + other.width

  
