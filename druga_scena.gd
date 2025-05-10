extends Node2D

var tekstic = "drugi teeeeeekst"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var faza = 0
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		if faza == 0:
			$textbox.show_name()
			$cheda_pricalica.visible = true
		if faza == 1:
			$textbox.show_content()
			$cheda_pricalica.start_talking()
		faza += 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $textbox.treperi_kraj == true:
		$cheda_pricalica.stop_talking()
	pass
