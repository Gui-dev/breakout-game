extends StaticBody2D

var x_minimum: float = 45
var x_maximum: float = 755
@export_category("variables")
@export var paddle_speed: float = 700.0 


func _process(delta: float) -> void:
  movement(delta)
  movement_limited()


func movement(delta: float) -> void:
  if Input.is_action_pressed("move_left"):
    position.x -= paddle_speed * delta
  elif Input.is_action_pressed("move_right"):
    position.x += paddle_speed * delta


func movement_limited() -> void:
  position.x = clamp(position.x, x_minimum, x_maximum)
