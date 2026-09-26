extends CanvasLayer
class_name PlayerHUD
@export var health_info: RichTextLabel
@export var score_info: RichTextLabel
@export var player: Player


func _ready() -> void:
	player.health_changed.connect(_on_health_changed)
	player.score_updated.connect(_on_score_updated)
	
	

func _on_score_updated(score: int):
	score_info.text = "Score: %s" % score
	
func _on_health_changed(health: int):
	health_info.text = "Hp: %s" % health
