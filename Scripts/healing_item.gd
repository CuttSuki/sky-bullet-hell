extends Item
class_name HealingItem
@export var heal_amount: int = 20



func interact_item(player: Player) -> void:
	print("Found healing item")
	player.current_hp += heal_amount
