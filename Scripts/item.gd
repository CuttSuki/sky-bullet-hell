extends CharacterBody2D
class_name Item


func _physics_process(delta: float) -> void:
	velocity.y = 30
	move_and_slide()
	
func interact_item(player: Player) -> void:
	pass
