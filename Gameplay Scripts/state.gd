# Interface for states
extends Node

# warning-ignore:unused_argument
func enter(host: PlayerPhysics):
	return

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func step(host: PlayerPhysics, delta: float):
	return

# warning-ignore:unused_argument
func exit(host: PlayerPhysics):
	return

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func animation_step(host: PlayerPhysics, animator: CharacterAnimator):
	return

# warning-ignore:unused_argument
func _on_animation_finished(anim_name: String):
	pass
