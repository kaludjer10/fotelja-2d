extends Node2D

var sledeca_scena = preload("res://scene/cetvrta_scena.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pozadina.set_image($pozadina.images[0])
	$tajmer_slike.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var i = 0
func _on_tajmer_slike_timeout() -> void:
	if i <= 4:
		$pozadina.set_image($pozadina.images[i])
	if i >= 9 and i <= 12:
		$pozadina.set_image($pozadina.images[i-4])
	if i >= 14:
		get_tree().change_scene_to_packed(sledeca_scena)
	i += 1
	pass # Replace with function body.
