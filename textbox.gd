extends CanvasLayer

@onready var labela_naslov = $textbox_container/MarginContainer/HBoxContainer/naslov
@onready var labela_sadrzaj = $textbox_container/MarginContainer/HBoxContainer/tekst
@onready var labela_kraj = $textbox_container/MarginContainer/HBoxContainer/kraj
@onready var tekstic = get_parent().tekstic;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_textbox()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func hide_textbox() -> void:
	labela_naslov.visible = false
	labela_sadrzaj.visible = false
	labela_kraj.visible = false


var treperi = false
func show_name() -> void:
	labela_naslov.visible = true
	treperi = true
	$tajmer_spori.start()

func show_content() -> void:
	$tajmer_spori.stop()
	labela_naslov.visible = true
	treperi = false 
	labela_sadrzaj.visible = true
	$tajmer.start()
	
func show_end() -> void:
	
	labela_kraj.visible = true
	treperi_kraj = true
	$tajmer_spori.start()

var treperi_kraj = false
func _on_tajmer_spori_timeout() -> void:
	if treperi:
		labela_naslov.visible = !labela_naslov.visible
	if treperi_kraj:
		labela_kraj.visible = !labela_kraj.visible
	pass # Replace with function body.



var i = 0
var stop = false
var pauza_brojac = 0
var pauza_duzina = 10

func _on_timer_timeout() -> void:
	#gledam da li je ispisan ceo tekst, pa ispisujem tekst za dalje
	if i == tekstic.length():
		$tajmer.stop()
		return show_end()
	
	#gledam da li treba pauza posle, i onda stampam slova
	if not stop:  
		if tekstic[i] == ',' or tekstic[i] == '.':
			stop = true
		labela_sadrzaj.text += tekstic[i]
		i += 1
	if pauza_brojac == pauza_duzina:   #deset tikova tajmera mi je pauza
		stop = false
		pauza_brojac = 0
	pauza_brojac += 1
	pass # Replace with function body.
