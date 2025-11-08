class_name ActionCommand
extends Node


signal command_succeeded
signal command_failed

var l_stick_position


func _ready() -> void:
	l_stick_position = Vector2.ZERO


func _process(delta: float) -> void:
	l_stick_position = Input.get_vector("menu_left", "menu_right", "menu_down", "menu_up")


func _physics_process(delta: float) -> void:
	pass
