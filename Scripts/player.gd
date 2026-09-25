extends CharacterBody2D
class_name Player
const SPEED: int = 200
@export var additional_speed: int = 1
@export var hurt_box: Area2D
@export var current_hp: int = 0
@export var max_hp: int = 0
var direction: Vector2 = Vector2.ZERO
signal health_changed(health: int)

func _ready() -> void:
	current_hp = max_hp
	rotation_degrees = -90
	hurt_box.body_entered.connect(_on_body_entered)
	

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED * additional_speed
	move_and_slide()

func _take_damage(amount: int):
	current_hp -= amount
	health_changed.emit(amount)
	
func _on_body_entered(body: Node2D):
	if body.is_in_group("enemy_bullet"):
		_take_damage(body.attack)
		body.queue_free()
