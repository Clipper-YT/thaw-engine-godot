extends Node

var debug : bool = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta):
	if Input.is_action_just_pressed("ui_full_screen"):
		OS.window_fullscreen = !OS.window_fullscreen
#	if Input.is_action_just_pressed("pause"):
#		get_tree().paused = !get_tree().paused
#		print(get_tree().paused)
