extends Node2D

var original_position: Vector2

var amplitude: float = 80
var wavelength: float = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	original_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var offset: Vector2 = Vector2(sin(Time.get_ticks_msec() / 1000.0 * wavelength) * amplitude, cos(Time.get_ticks_msec() / 1000.0 * wavelength) * amplitude)
	position = original_position + offset
