extends CharacterBody2D
class_name Enemy
@export var hp: int = 100
@export var speed: int = 100
@export var hurt_box: Area2D

func _ready() -> void:
	rotation_degrees = 90
	hurt_box.body_entered.connect(_on_body_entered)

func _move():
	velocity.y = speed
	move_and_slide()
	
	
func _take_damage(amount: int):
	hp -= amount
	
func _physics_process(_delta: float) -> void:
	_move()
	if hp <= 0:
		queue_free()

func _on_body_entered(body: Node2D):
	if body.is_in_group("player_bullet"):
		_take_damage(body.attack)
