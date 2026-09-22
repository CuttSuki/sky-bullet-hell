extends Node2D
class_name Spawner
@export var cooldown: int = 3
@export var leftmost_side: Marker2D 
@export var rightmost_side: Marker2D
func _ready() -> void:
	while true:
		var enemy: Enemy = load("res://Scenes/Enemies/enemy.tscn").instantiate()
		enemy.position.x  = randf_range(leftmost_side.position.x, rightmost_side.position.x)
		enemy.position.y = leftmost_side.position.y
		add_child(enemy)
		await get_tree().create_timer(cooldown).timeout
