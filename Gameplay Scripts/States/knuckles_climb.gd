extends '../state.gd'

var dirsign

func enter(host: PlayerPhysics):
	dirsign = sign(host.velocity.x)

func step(host, _delta):
	if Input.is_action_pressed("ui_up"):
		host.velocity.y = -60
	elif Input.is_action_pressed("ui_down"):
		host.velocity.y = 60
	else: host.velocity.y = 0
	
	if Input.is_action_pressed("ui_accept"):
		host.velocity.x = -240 * dirsign
		host.velocity.y = -240
		return 'OnAir'
	
	if dirsign == -1:
		pass
	elif dirsign == 1:
		pass
