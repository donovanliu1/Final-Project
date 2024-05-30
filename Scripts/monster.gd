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
	
	move_and_slide()
	print("monster position: ", position)

func update_target_location(target_location):
	nav_agent.target_position = target_location

