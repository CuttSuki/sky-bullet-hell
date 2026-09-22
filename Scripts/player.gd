extends CharacterBody2D
class_name Player
const SPEED: int = 200
@export var additional_speed: int = 1
@export var hurt_box: Area2D
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	hurt_box.body_entered.connect(_on_body_entered)


func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED * additional_speed
	move_and_slide()

func _on_body_entered(body: Node2D):
	pass
