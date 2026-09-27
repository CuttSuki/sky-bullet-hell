extends Node2D
class_name ItemSpawner
@export var item_container: Node2D
@export var leftmost_side: Marker2D
@export var rightmost_side: Marker2D


func _ready() -> void:
	while true:
		var item: Item = load("res://Scenes/Item/healing_item.tscn").instantiate()
		item.position.x = randf_range(leftmost_side.position.x, rightmost_side.position.x)
		item.position.y = leftmost_side.position.y
		item_container.add_child(item)
		await get_tree().create_timer(5).timeout
