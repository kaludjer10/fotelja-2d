extends Node2D

var tekstic = "`ejou, imam drogetine alooooooo ej ej ejjjj droooogaaaaaaaaaa\ndrogica :3"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var faza = 0
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		if faza == 0:
			$pozadina.set_image($pozadina.images[0])
			$textbox.show_name()
			$cheda_pricalica.visible = true
		if faza == 1:
				$pozadina.set_image($pozadina.images[1])
				$textbox.show_content()
				$cheda_pricalica.start_talking()
		if faza == 2:
			if $cheda_pricalica.is_talking:
				return
		faza += 1
	

var sledeca_scena = preload("res://druga_scena.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $textbox.treperi_kraj == true:
		$cheda_pricalica.stop_talking()
	if faza == 3:
		
		get_tree().change_scene_to_packed(sledeca_scena)
