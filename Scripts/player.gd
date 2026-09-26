extends CharacterBody2D
class_name Player
const SPEED: int = 200
@export var additional_speed: int = 1
@export var hurt_box: Area2D
@export var current_hp: int = 0
@export var max_hp: int = 0
@export var current_score: int = 0
@export var spawner: Node2D 
var direction: Vector2 = Vector2.ZERO
signal health_changed(health: int)
signal score_updated (score: int)

func _ready() -> void:
	current_hp = max_hp
	health_changed.emit.call_deferred(current_hp)
	rotation_degrees = -90
	hurt_box.body_entered.connect(_on_body_entered)
	spawner.child_exiting_tree.connect(_on_spawner_child_exiting_tree)
	

func _on_spawner_child_exiting_tree(node: Node2D):
	if node is Enemy:
		current_score += 10
		score_updated.emit(current_score)
	
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED * additional_speed
	move_and_slide()

func _take_damage(amount: int):
	current_hp -= amount
	health_changed.emit(current_hp)
	
func _on_body_entered(body: Node2D):
	if body.is_in_group("enemy_bullet"):
		_take_damage(body.attack)
		body.queue_free()
