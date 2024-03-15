extends Control



func _on_StartGameButton_pressed():
	get_tree().change_scene("res://World.tscn") 
func _on_QuitGameButton_pressed():
	get_tree().quit()


func _on_loadgame_pressed():
	var savegame = load("save.tres")
	if savegame.scene != null:
		var res = get_tree().change_scene(savegame.scene)
		#var startPosition = PlayerVariables.position
		#PlayerVariables.position = startPosition
