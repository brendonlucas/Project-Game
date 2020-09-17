extends Spatial

func _on_Switch_pressed():
	$CanvasLayer/Switch.hide()
	BackgroundLoad.load_scene("res://maps/menu_inicial/menu_principal.tscn")

