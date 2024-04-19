extends StaticBody2D
class_name Block


@export_category("variables")
@export var _block_health: int = 1
@export_category("objects")
@export var _block_color_red: Color
@export var _block_color_green: Color
@export var _block_color_blue: Color


func _ready():
  _update_color()
  

func hit_damage() -> void:
  _block_health -= 1
  if _block_health >= 1:
    _update_color()
  if _block_health <= 0:
    queue_free()


func _update_color() -> void:
  if _block_health == 3:
    modulate = _block_color_green
  elif _block_health == 2:
    modulate = _block_color_blue
  elif _block_health == 1:
    modulate = _block_color_red
  else:
    modulate = Color.WHITE
