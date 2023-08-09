extends Node

@onready var aim_system: AimSystem2D = $TracksMouse

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	aim_system.aim_at_mouse()
	#print(aim_system.aim_direction())

