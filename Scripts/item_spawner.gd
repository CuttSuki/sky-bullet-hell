extends Node2D
class_name ItemSpawner
@export var item_container: Node2D
@export var leftmost_side: Marker2D
@export var rightmost_side: Marker2D
const ITEM_SCENE_DIR: String = "res://Scenes/Item/"
@export var item_array: Array[PackedScene] = []


func _ready() -> void:
	while true:
		var item: Item = item_array.pick_random().instantiate()
		item.position.x = randf_range(leftmost_side.position.x, rightmost_side.position.x)
		item.position.y = leftmost_side.position.y
		item_container.add_child(item)
		await get_tree().create_timer(10).timeout
