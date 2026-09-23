extends CharacterBody2D
class_name Bullet
@export var attack: int = 10
@export var speed: int = 250
@export var duration: int = 10
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	get_tree().create_timer(duration).timeout.connect(func():
		call_deferred("queue_free"))

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
