Game = (canvas) ->
  self = this
  @context = canvas.getContext("2d")
  @width = canvas.width
  @height = canvas.height

  @keyPressed = {}

  $("canvas").on "keydown keyup", (e) ->
    keyName = Game.keys[e.which]
    if keyName
      @keyPressed[keyName] = e.type == "keydown"
      e.preventDefault()
    
    return

  return

Game.keys = 
  32: "space"
  37: "left"
  38: "up"
  39: "right"
  40: "down"

Game::start = ->
  self = this
  fps = 60
  interval = fps / 1000

  setInterval (->
    self.update()
    self.draw()
    return
  ), interval
  return

Game::update = ->
  @entities.forEach (entity) ->
    entity.update() if entity.update
    return
  return
  

Game::draw = ->
  self = this
  @entities.forEach (entity) ->
    entity.draw(@context) if entity.draw
    return
  return

