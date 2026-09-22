extends CharacterBody2D
class_name Enemy
@export var hp: int = 100
@export var speed: int = 100



func _physics_process(delta: float) -> void:
	velocity.y = speed
	move_and_slide()
	
