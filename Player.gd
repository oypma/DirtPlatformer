extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -550
const MAX_FALLING_SPEED = 999

var motion = Vector2()


func _physics_process(delta):
	print($CanvasLayer/Virtualjoystick.get_output())
	motion.y += GRAVITY
	if motion.y > MAX_FALLING_SPEED:
		motion.y -= 40
	if Input.is_action_pressed("ui_home"):
		get_tree().reload_current_scene()
	var friction = false
	
	if Input.is_action_just_pressed("save"):
		save()
	if Input.is_action_just_pressed("StartMenu"):
		get_tree().change_scene("StartMenu.tscn")
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION,- MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y>5:
			$Sprite.play("Fall")
		else:
			$Sprite.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion, UP)
	pass
	
func save():
	var savegame = SaveGame.new()
	savegame.scene = get_tree().current_scene.filename
	ResourceSaver.save("save.tres", savegame)
