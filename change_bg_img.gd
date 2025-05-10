extends Sprite2D

var images = [
	preload("res://PIXEL_TVTV_1.webp"),
	preload("res://PIXEL_NOKIA_na_stoluu1.webp"),
]
   
func set_image(img):
	var screen_size = get_viewport_rect().size
	var tex_size = img.get_size()
	texture = img
	scale = screen_size / tex_size
	position = Vector2.ZERO
	centered = false

func _ready():
	set_image(images[1])
