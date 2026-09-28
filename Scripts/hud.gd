extends CanvasLayer
class_name PlayerHUD
@export var health_info: RichTextLabel
@export var score_info: RichTextLabel
@export var player: Player
@export var game_over_panel: Panel
@export var total_score: Label 
@export var reset_button: Button


func _ready() -> void:
	game_over_panel.visible = false
	player.game_over.connect(_on_game_over)
	player.health_changed.connect(_on_health_changed)
	player.score_updated.connect(_on_score_updated)
	reset_button.pressed.connect(func():
		get_tree().paused  = false
		get_tree().reload_current_scene()
		)
	

func _on_score_updated(score: int):
	score_info.text = "Score: %s" % score
	
func _on_health_changed(health: int):
	health_info.text = "Hp: %s" % health

func _on_game_over():
	game_over_panel.visible = true
	total_score.text = score_info.text
	get_tree().paused = true
	
