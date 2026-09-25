extends BulletPattern
class_name ShotgunBulletPattern

func _set_bullet():
	var bullet_count := 10
	var total_spread := deg_to_rad(60) 
	var start_angle := parent.global_rotation - (total_spread / 2.0)
	var angle_step := total_spread / (bullet_count - 1)

	for i in range(bullet_count):
		var bullet: Bullet = bullet_path.instantiate()
		if parent is Enemy:
			bullet.add_to_group("enemy_bullet")
		elif parent is Player:
			bullet.add_to_group("player_bullet")
		BulletContainer.add_child(bullet)
		bullet.global_position = parent.global_position

		var bullet_angle := start_angle + (angle_step * i)
		bullet.direction = Vector2.RIGHT.rotated(bullet_angle)
		bullet.rotation = bullet_angle
