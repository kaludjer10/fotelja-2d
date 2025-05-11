extends Node2D

var tekstic = "*кхм*| хало?||  ...е-- е, кућо,| ај дођи доооо............
.... оваај,| ај дођи до скупштине;| тото, тамо код
оне бандере, ту ме сачекај.|| ајде,| љуби те брат :*"

var tekstic_kraj = "prekini\n(spejs)"
var tekstic_naslov = "чеда:"

var sledeca_scena = preload("res://scene/treca_scena.tscn")
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pozadina.set_image($pozadina.images[1])
	$textbox.show_name()
	$cheda_pricalica.visible = true
	$textbox/textbox_container/MarginContainer/HBoxContainer/naslov.text = tekstic_naslov
	$textbox/textbox_container/MarginContainer/HBoxContainer/kraj.text = tekstic_kraj
	pass # Replace with function body.

var faza = 0
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		if faza == 0:   #krece da se ispisuje tekst
				$textbox.show_content()
				$cheda_pricalica.start_talking()
		if faza == 1:   #ispisuje se tekst
			if !$textbox.treperi_kraj: #gledam da li je ispisan tekst
				return
		faza += 1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $textbox.treperi_kraj == true:
		$cheda_pricalica.stop_talking()
	if faza == 2:
		get_tree().change_scene_to_packed(sledeca_scena)
