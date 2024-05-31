extends CharacterBody3D

@export var player : CharacterBody3D
@onready var nav_agent = $NavigationAgent3D

var SPEED = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	velocity = velocity.move_toward(new_velocity, .5)
	
	var target_vector = global_position.direction_to(next_location)
	target_vector.y = 0
	var target_basis = Basis.looking_at(target_vector)
	print(target_basis)
	basis = basis.slerp(target_basis, 0.5)
	#basis = target_basis
	
	move_and_slide()
	#print("monster position: ", position)

func update_target_location(target_location):
	nav_agent.target_position = target_location

