extends Node2D
class_name Spawner

@export var leftmost_side: Marker2D 
@export var rightmost_side: Marker2D
@export var player: Player
var time_elapsed: float
var used_positions: Array = []
var spawn_data: Dictionary = {
	"ship_1": {
		"base":100,
		"step": -0.5,
		"min": 10,
		"max_count": 3,
		"delay": 5
	},
	"ship_2": {
		"base": 30,
		"step": 0.5,
		"max": 100,
		"max_count": 3,
		"delay": 8
	},
	"ship_3": {
		"base": 20,
		"step": 1,
		"max": 100,
		"max_count": 5,
		"delay": 5
	}
}

func _ready() -> void:
	_set_spawn()
	
func _physics_process(delta: float) -> void:
	time_elapsed += delta

func _set_spawn():
	for ship_name in spawn_data:
		var ship_spawn_data: Dictionary = spawn_data[ship_name]
		var timer: Timer = Timer.new()
		timer.wait_time = ship_spawn_data.get("delay", 3)
		add_child(timer)
		timer.timeout.connect(func():
			used_positions.clear()
			var can_spawn: bool = randi() % 100 < clamp(ship_spawn_data["base"] + (ship_spawn_data["step"] * time_elapsed), ship_spawn_data.get("min", 1), ship_spawn_data.get("max", 100))
			if can_spawn:
				for i in range(randi() % ship_spawn_data.get("max_count", 1)):
					var enemy_ship: Enemy = load("res://Scenes/Enemies/%s.tscn" % ship_name).instantiate()
					enemy_ship.position.x = await _find_unique_x_position()
					enemy_ship.position.y = rightmost_side.position.y
					add_child(enemy_ship)
			)
		timer.start()
		
func _find_unique_x_position():
	var spacing: int = 70
	var x_pos: int = randi_range(leftmost_side.position.x + player.position.x , rightmost_side.position.x - player.position.x)
	while x_pos in used_positions:
		print("x position: %s within used_positions" % x_pos)
		x_pos = randi_range(leftmost_side.position.x + player.position.x , rightmost_side.position.x - player.position.x)
		await get_tree().physics_frame
	for i in range(spacing):
		used_positions.append(x_pos + i)
		used_positions.append(x_pos - i)
	return x_pos
