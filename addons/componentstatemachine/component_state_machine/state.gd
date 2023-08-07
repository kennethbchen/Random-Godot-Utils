class_name State
extends Node

var components: Array[StateComponent]

signal state_changed(new_state: String)

func _ready():
	
	for child in get_children():
		
		if not child is StateComponent:
			continue
		
		# Bubble up signals from components
		var c = child as StateComponent
		components.append(c)
		c.state_changed.connect(func(new_state: String): state_changed.emit(new_state))
		

func enter() -> void:
	for component in components:
		component.enter()

func unhandled_input(event: InputEvent):
	for component in components:
		component.unhandled_input(event)

func process(delta: float) -> void:
	for component in components:
		component.process(delta)
	
func physics_process(delta: float) -> void:
	for component in components:
		component.physics_process(delta)

func exit() -> void:
	for component in components:
		component.exit()
