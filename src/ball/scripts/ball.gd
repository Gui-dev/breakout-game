extends Area2D


var initial_position: Vector2 = Vector2(400, 450)
var initial_direction: Vector2 = Vector2(0, 0)
var new_direction: Vector2 = Vector2(0, 0)
var first_throw: bool = true
@export_category("variables")
@export var ball_speed: float = 400.0


func _ready() -> void:
  first_throw = true
  reset_ball()


func _process(delta):
  if first_throw:
    if Input.is_action_just_pressed("throw-ball"):
      select_initial_position()
      first_throw = false
  ball_movement(delta)


func reset_ball() -> void:
  position = initial_position
  

func select_initial_position() -> void:
  var random_x = [-1, 1].pick_random()
  initial_direction = Vector2(random_x, -1)
  new_direction = initial_direction
  

func ball_movement(delta: float) -> void:
  position += new_direction * ball_speed * delta
