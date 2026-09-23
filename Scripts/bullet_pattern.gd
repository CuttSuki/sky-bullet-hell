extends Node2D
class_name BulletPattern
@export var parent: CharacterBody2D
@export var bullet_path: PackedScene
@export var cooldown: float = 3
@export var next_bullet_pattern: BulletPattern
@export var container: Node
var timeSinceLastCooldown: float 


func _set_bullet():
	var bullet: Bullet = bullet_path.instantiate()
	if parent is Enemy:
		bullet.add_to_group("enemy_bullet")
	elif parent is Player:
		bullet.add_to_group("player_bullet")
	_fire_bullet(bullet)
	
func _fire_bullet(bullet: Bullet):
	BulletContainer.add_child(bullet)
	bullet.global_position = parent.global_position
	bullet.direction = Vector2.RIGHT.rotated(parent.global_rotation)
	bullet.rotation = bullet.direction.angle()

func _physics_process(delta: float) -> void:
	if not parent:
		return 
	timeSinceLastCooldown += delta
	if timeSinceLastCooldown > cooldown:
		timeSinceLastCooldown = 0
		_set_bullet()
	
