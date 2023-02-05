extends CharacterBody2D

@export var speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 1)
#parameters/Idle/blend_position

@onready var animation_tree = $AnimationTree

func _ready():
	update_animation_parameters(starting_direction)


func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("move_Right") - Input.get_action_strength("move_Left"),
		Input.get_action_strength("move_Down") - Input.get_action_strength("move_Up")
		)
		
	update_animation_parameters(input_direction)
		
	velocity = input_direction * speed
		
	move_and_slide()

func update_animation_parameters(move_input : Vector2):
	#Dont change animation param if there is no move input stupid
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)
