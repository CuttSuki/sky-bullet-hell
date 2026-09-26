extends Node2D
class_name Spawner

@export var leftmost_side: Marker2D 
@export var rightmost_side: Marker2D
var time_elapsed: float
var spawn_data: Dictionary = {
	"ship_1": {
		"base":100,
		"step": -0.1,
		"min": 10,
		"max_count": 5,
		"delay": 5
	},
	"ship_2": {
		"base": 20,
		"step": 0.3,
		"max": 100,
		"max_count": 3,
		"delay": 10
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
			var can_spawn: bool = randi() % 100 < clamp(ship_spawn_data["base"] + (ship_spawn_data["step"] * time_elapsed), ship_spawn_data.get("min", 1), ship_spawn_data.get("max", 100))
			if can_spawn:
				for i in range(randi() % ship_spawn_data.get("max_count", 1)):
					var enemy_ship: Enemy = load("res://Scenes/Enemies/%s.tscn" % ship_name).instantiate()
					enemy_ship.position.x = randf_range(leftmost_side.position.x, rightmost_side.position.x) * i
					enemy_ship.position.y = rightmost_side.position.y
					add_child(enemy_ship)
			)
		timer.start()
		
		
		
