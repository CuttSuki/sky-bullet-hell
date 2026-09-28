extends ShotgunBulletPattern
class_name RapidFireBulletPattern


func _set_bullet():
	for i in range(num_of_hits):
		for marker: Marker2D in aim_group.get_children():
			var bullet: Bullet = bullet_path.instantiate()
			if parent is Enemy:
				bullet.add_to_group("enemy_bullet")
			elif parent is Player:
				bullet.add_to_group("player_bullet")
			BulletContainer.add_child(bullet)
			bullet.global_position = marker.global_position
			bullet.scale = parent.scale
			bullet.direction = Vector2.RIGHT.rotated(parent.global_rotation)
			bullet.rotation = bullet.direction.angle()
		await get_tree().create_timer(multi_cd).timeout
