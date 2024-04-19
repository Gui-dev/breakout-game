extends Area2D
class_name Ball


var initial_position: Vector2 = Vector2(400, 450)
var initial_direction: Vector2 = Vector2.ZERO
var new_direction: Vector2 = Vector2.ZERO
var first_throw: bool = true
var ball_fell: bool = false
var screen_minimum_size_x: float = 1
var screen_maximum_size_x: float = 790
var screen_minimum_size_y: float = 1
var screen_maximum_size_y: float = 590
@export_category("variables")
@export var ball_speed: float = 400.0
@export_category("objects")
@export var ball_timer: Timer = null


func _ready() -> void:
  first_throw = true
  reset_ball()


func _process(delta):
  if first_throw:
    if Input.is_action_just_pressed("throw-ball"):
      select_initial_position()
      first_throw = false
  ball_movement(delta)
  verify_ball_position()


func reset_ball() -> void:
  position = initial_position
  

func select_initial_position() -> void:
  var random_x = [-1, 1].pick_random()
  initial_direction = Vector2(random_x, -1)
  new_direction = initial_direction
  

func ball_movement(delta: float) -> void:
  position += new_direction * ball_speed * delta


func verify_ball_position() -> void:
  if position.y <= screen_maximum_size_y:
    if position.y < screen_minimum_size_y:
      new_direction.y *= -1
    if position.x < screen_minimum_size_x or position.x > screen_maximum_size_x:
      new_direction.x *= -1
  if position.y > screen_maximum_size_y and not ball_fell:
    ball_timer.start()
    ball_fell = true
    

func ball_left_screen() -> void:
  new_direction = Vector2.ZERO
  first_throw = true
  reset_ball()


func _on_body_entered(body: StaticBody2D) -> void:
  if body.is_in_group("player"):
    new_direction.y *= -1
  if body.is_in_group("block"):
    body.hit_damage()
    new_direction.y *= -1
  

func _on_timer_timeout():
  ball_left_screen()
  ball_fell = false
