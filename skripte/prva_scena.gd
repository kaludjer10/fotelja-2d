extends Node2D

var tekstic = "брунда радилица.....||
дал да се јавим.....?||"

var tekstic_kraj = "ае\n(спејсЉЉ)"
var tekstic_naslov = "*"

var sledeca_scena = preload("res://scene/druga_scena.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pozadina.set_image($pozadina.images[0])
	$textbox/textbox_container/MarginContainer/HBoxContainer/naslov.text = tekstic_naslov
	$textbox/textbox_container/MarginContainer/HBoxContainer/kraj.text = tekstic_kraj
	pass # Replace with function body.

var faza = 0
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		if faza == 0:   #prva slika i naslov
			$pozadina.set_image($pozadina.images[0])
			$textbox.show_name()
			#$cheda_pricalica.visible = true
		if faza == 1:   #krece da se ispisuje tekst
				$pozadina.set_image($pozadina.images[1])
				$textbox.show_content()
				#$cheda_pricalica.start_talking()
		if faza == 2:   #kraj ispisivanja teksta
			if !$textbox.treperi_kraj:
				return
		faza += 1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $textbox.treperi_kraj == true:
		$cheda_pricalica.stop_talking()
	if faza == 3:
		get_tree().change_scene_to_packed(sledeca_scena)
