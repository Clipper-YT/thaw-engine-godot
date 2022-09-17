extends Node2D

export(String) var LevelName = "Metropolis"
export(String) var Num = "3"

func _ready():
	$"Left Side/LevelName".text = LevelName
	$"Left Side/Num".text = Num
	$AnimationPlayer.play("anim")
