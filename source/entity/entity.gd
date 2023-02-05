extends CharacterBody2D
class_name Entity

@export var speed : float = 100

func cartesian_to_isometric(cartesian : Vector2) -> Vector2:
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

func movement_loop() -> void:
	velocity = cartesian_to_isometric(velocity)
	move_and_slide()
