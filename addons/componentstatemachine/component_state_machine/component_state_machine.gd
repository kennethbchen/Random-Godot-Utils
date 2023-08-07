extends Node
# https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/
class_name ComponentStateMachine

@export var initial_state = NodePath()

@onready var _state: State = get_node(initial_state)

var _state_nodes: = {}

signal state_changed(new_state: String)

func init(parent):
	# Connect to all state_changed signals
	for child in get_children():
		if not child is State:
			return
		
		var c = child as State
		_state_nodes[c.name] = c
		c.state_changed.connect(_on_state_changed.bind())
		c.owner = parent
	
	_state = get_node(initial_state)
	_state.enter()

func unhandled_input(event) -> void:
	_state.unhandled_input(event)

func process(delta) -> void:
	_state.process(delta)

func physics_process(delta) -> void:
	_state.physics_process(delta)

func transition_to(new_state: String, msg:={}) -> void:
	
	if not _state_nodes.has(new_state):
		push_warning("Warning: State \"" + str(new_state) + "\" does not exist.")
		return
	
	_state.exit()
	_state = _state_nodes[new_state]
	_state.enter()
	
	state_changed.emit(new_state)

func _on_state_changed(new_state: String) -> void:
	transition_to(new_state)
	

