extends Sprite2D

var images
   
func set_image(img):
	var screen_size = get_viewport_rect().size
	var tex_size = img.get_size()
	texture = img
	scale = screen_size / tex_size
	position = Vector2.ZERO
	centered = false

func _ready():
	#await get_tree().process_frame
	var trenutna = get_tree().current_scene.name
	if trenutna == "prva_scena" or trenutna == "druga_scena":
		images = [
		preload("res://slike/tv_pocetak.png"), 
		preload("res://slike/nokijica.webp"),
		]
	if trenutna == "treca_scena":
		images = [
		preload("res://slike/mrak.png"),
		preload("res://slike/mrak2.png"),
		preload("res://slike/mrak3.png"),
		preload("res://slike/mrak4.png"),
		preload("res://slike/samo_lik.png"),
		preload("res://slike/sjupstina_1.png"), 
		preload("res://slike/sjupstina_2.png"), 
		preload("res://slike/sjupstina_3.png"),
		preload("res://slike/sjupstina_4.png")
		]
	if trenutna == "cetvrta_scena":
		images = [
		preload("res://slike/kola1.png"),
		preload("res://slike/kola2.png"),
		preload("res://slike/kola3.png"),
		]
	pass
