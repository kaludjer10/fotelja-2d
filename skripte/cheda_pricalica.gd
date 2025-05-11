extends Node2D

@export var closed_mouth_texture: Texture2D
@export var open_mouth_texture: Texture2D
@export var flap_speed := 0.2  # Seconds between open/close

var is_talking := false

func _ready():
	$usta_tajmer.wait_time = flap_speed
	$usta_tajmer.timeout.connect(_on_mouth_timer_timeout)
	$glava.texture = closed_mouth_texture

func start_talking():
	is_talking = true
	$usta_tajmer.start()

func stop_talking():
	is_talking = false
	$usta_tajmer.stop()
	$glava.texture = closed_mouth_texture

func _on_mouth_timer_timeout():
	if not is_talking:
		return

	# Flip between open/closed
	if $glava.texture == closed_mouth_texture:
		$glava.texture = open_mouth_texture
	else:
		$glava.texture = closed_mouth_texture
