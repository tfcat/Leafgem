class Leafgem::Mouse::Click
  property pos : Vec2(Int32)
  property event : SDL::Event::MouseButton
  property held : Bool

  # TODO: Update `#held?` and `#pressed?` automatically
  def initialize(@event, @pressed = true)
    @pos = Vec2.from @event.x, @event.y
    @held = !@pressed
    # @when_pressed = event.timestamp
  end

  # Has the button press been held?
  def held?
    @held
  end

  # Was the button pressed?
  def pressed?
    @pressed
  end

  # Update `#held?` and `#pressed?`
  def update
    @pressed = false
    @held = !@pressed
  end

  # Update with a new mouse event
  def update(@event, @pressed = false)
    @pos = Vec2.from @event.x, @event.y
    @held = !@pressed
  end
end
