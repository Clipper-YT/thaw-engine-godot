extends '../state.gd'

var tails_flight_timer

func enter(host: PlayerPhysics):
	host.rotation_degrees = 0
	host.tails_tired = false
	tails_flight_timer = host.tails_flight_time
	host.audio_player.play('tails_fly')

func step(host, _delta):
	if host.is_grounded:
		host.ground_reacquisition()
		return 'OnGround'
	if !host.tails_tired:
		tails_flight_timer -= 1
		if tails_flight_timer <= 0:
			tails_flight_timer = host.tails_flight_time
			host.tails_tired = true
			host.audio_player.stop('tails_fly')
			host.audio_player.play('tails_tired')
	if Input.is_action_pressed("ui_left"):
		if host.velocity.x > -host.TOP:
			host.velocity.x -= 0.09375*60
	elif Input.is_action_pressed("ui_right"):
		if host.velocity.x < host.TOP:
			host.velocity.x += 0.09375*60
	if !host.tails_tired:
		if host.velocity.y >= -60:
			if Input.is_action_just_pressed("ui_accept"): # Only allow upward movement if Tails not tired
				host.velocity.y = -0.125*60
			if Input.is_action_pressed("ui_accept"):
				host.velocity.y -= 0.125*60
		else:
			host.velocity.y = -60
	if host.velocity.y < 0 and host.velocity.y > -240:
		host.velocity.x -= int(host.velocity.x / 7.5) / 15360.0
	host.velocity.x = 0 if host.is_wall_left and host.velocity.x < 0 else host.velocity.x
	host.velocity.x = 0 if host.is_wall_right and host.velocity.x > 0 else host.velocity.x
	
	if !host.tails_tired:
		if host.velocity.y < host.FALL:
			host.velocity.y += 0.03125*60
		else:
			host.velocity.y = host.FALL
	elif  host.tails_tired:
		if host.velocity.y < host.FALL:
			host.velocity.y += host.GRV
		else:
			host.velocity.y = host.FALL
	
	if Input.is_action_just_pressed("ui_down"):
		return 'OnAir'

func exit(host: PlayerPhysics):
	host.audio_player.stop('tails_fly')
	host.audio_player.stop('tails_tired')

func animation_step(host: PlayerPhysics, animator: CharacterAnimator):
	if Input.is_action_pressed("ui_right"):
		host.character.scale.x = 1
	elif Input.is_action_pressed("ui_left"):
		host.character.scale.x = -1
	var anim_name = 'flying'
	animator.animate(anim_name, 1, true)
