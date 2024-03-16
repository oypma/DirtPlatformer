extends Control

var reset_game:bool = false

func _on_StartGameButton_pressed():
	get_tree().change_scene("res://World.tscn") 
func _on_QuitGameButton_pressed():
	get_tree().quit()


func _on_loadgame_pressed():
	var savegame = load("save.tres")
	if savegame.scene != null:
		if reset_game == false:
			var res = get_tree().change_scene(savegame.scene)
		if reset_game == true:
			var res = get_tree().change_scene("res://World.tscn")
			reset_game = false

func _on_ResetGame_pressed():
	reset_game = true
