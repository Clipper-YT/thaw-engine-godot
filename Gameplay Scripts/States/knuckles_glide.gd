extends '../state.gd'

var t
var direction : bool

func enter(host: PlayerPhysics):
	t = host.velocity.x
	host.velocity.x = 4*60 * sign(t)
	direction = true if sign(t) == 1 else false

func step(host, _delta):
	if host.is_grounded:
		host.ground_reacquisition()
		return 'OnGround'
	elif !host.is_grounded:
		if host.is_on_floor():
			host.is_grounded = true
	if direction == false:
		if host.velocity.x > -24*60:
			host.velocity.x -= 4*60
		if host.velocity.x < 0:
			var a = 0
			a += 2.8125*60 * -sign(t)
			host.velocity.x = t * cos(a)
	elif direction == true:
		if host.velocity.x < 24*60:
			host.velocity.x += 4*60
		if host.velocity.x > 0:
			var a = 180
			a +=2.8125*60 * -sign(t)
			host.velocity.x = t * cos(a)
	
	if host.is_wall_left:
		return 'KnucklesClimb'
	if host.is_wall_right:
		return 'KnucklesClimb'
	
	if host.velocity.y < 0.5*60:
		host.velocity.y += 0.125*60
	elif host.velocity.y > 0.5*60:
		host.velocity.y -= 0.125*60
	
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		t = host.velocity.x
		direction = true if sign(t) == 1 else false
	
	if Input.is_action_just_released("ui_accept"):
		return 'OnAir'

func exit(host: PlayerPhysics):
	host.has_jumped = true

func animation_step(host: PlayerPhysics, animator: CharacterAnimator):
	pass
#	if Input.is_action_pressed("ui_right"):
#		host.character.scale.x = 1
#	elif Input.is_action_pressed("ui_left"):
#		host.character.scale.x = -1
#	var anim_name = 'flying'
#	animator.animate(anim_name, 1, true)
