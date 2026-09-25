extends Node2D
class_name Main
@export var despawn_area: Area2D


func _ready() -> void:
	despawn_area.body_entered.connect(_on_body_entered)
	
	
func _on_body_entered(body: Node2D):
	if body is Enemy:
		body.queue_free()
