@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("ComponentStateMachine", "Node", preload("res://addons/componentstatemachine/component_state_machine/component_state_machine.gd"), preload("component_state_machine/ComponentStateMachine.svg"))

func _exit_tree():
	remove_custom_type("ComponentStateMachine")
