extends Sprite2D

func _ready():
	on_size_changed()
	get_tree().get_root().connect("size_changed", on_size_changed)

func on_size_changed():
	print("Resizing: ", get_viewport_rect().size)
	var viewportWidth = get_viewport().size.x
	#var _viewportHeight = get_viewport().size.y

	var my_scale = viewportWidth / texture.get_size().x

	set_scale(Vector2(my_scale, my_scale))

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	self.material.set_shader_parameter("blue", input_direction.x)
