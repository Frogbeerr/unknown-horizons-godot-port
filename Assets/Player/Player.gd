extends Control
class_name Player

var faction = Global.Faction.NONE

var settlements = []
var ships = []

var camera

#warning-ignore-all:unused_class_variable

func _ready() -> void:
	print_debug(
		"I'm {0} in faction {1} ({2}).".format(
				[Config.player_name, faction, Global.FACTIONS[faction]])
		)
	mouse_filter = Control.MOUSE_FILTER_PASS
	print_debug(
		"My Mouse filter ist %s" % mouse_filter
	)

func _on_Game_notification(message_type, message_text) -> void:
	if camera != null:
		var hud = camera.get_node("PlayerHud")
		hud.raise_notification(message_type, message_text)
