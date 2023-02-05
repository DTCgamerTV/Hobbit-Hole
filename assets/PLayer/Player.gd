extends Entity
class_name Player

@export var starting_direction : Vector2 = Vector2(0, 1)
#parameters/Idle/blend_position

@onready var animation_tree = $AnimationTree

func _ready() -> void:
	update_animation_parameters(starting_direction)


func _physics_process(_delta) -> void:
	update_animation_parameters(controls_loop())
	movement_loop()

func update_animation_parameters(move_input : Vector2) -> void:
	#Dont change animation param if there is no move input stupid
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)

func controls_loop() -> Vector2:
	var input_direction = Vector2(
		Input.get_action_strength("move_Right") - Input.get_action_strength("move_Left"),
		Input.get_action_strength("move_Down") - Input.get_action_strength("move_Up")
		)
	velocity = input_direction.normalized() * speed
	return input_direction
