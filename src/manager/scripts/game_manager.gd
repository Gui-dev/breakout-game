extends Node2D
class_name GameManager


var quantity_block: int = 0
@export_category("objects")
@export var blocks: Node2D = null
@export var new_scene: String
@export var timer: Timer


func _ready() -> void:
  search_blocks()
  

func _process(_delta: float) -> void:
  get_inputs()
  

func get_inputs() -> void:
  if Input.is_action_just_pressed("restart"):
    get_tree().reload_current_scene()
  if Input.is_action_just_pressed("exit"):
    get_tree().quit()
  

func search_blocks() -> void:
  for block in blocks.get_children():
    quantity_block += 1


func update_quantity_block() -> void:
  quantity_block -= 1
  if quantity_block <= 0:
    timer.start()


func _on_timer_timeout():
  get_tree().change_scene_to_file(new_scene)
