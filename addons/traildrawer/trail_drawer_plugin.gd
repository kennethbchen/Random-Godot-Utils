@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("TrailDrawer2D", "Line2D", preload("trail_drawer_2d/trail_drawer_2d.gd"), preload("trail_drawer_2d/TrailDrawer2D.svg"))
	
func _exit_tree():
	remove_custom_type("TrailDrawer2D")
