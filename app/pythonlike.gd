extends Control

var Velocity : Vector2 

var lastposition : Vector2

var polygon : PackedVector2Array

@export var Triangle : Polygon2D

var boundary : Vector2i

var cam : Camera2D

var cam_up = false

var cam_down = false

var cam_right = false

var cam_left = false

var cam_velocity : Vector2

func _ready():
	print("Hello World") 
	print(Triangle.name)
	
	Velocity.x = 125
	Velocity.y = 100
	
	lastposition = Triangle.global_position
	
	get_tree().get_root() # access via scenemainloop
	print(get_tree().get_root().size)
	
	boundary.x = 1152 #1152 base
	boundary.y = 648 #648 base
	print(Triangle.polygon)
	
	var root = get_tree().get_root()
	
	cam = Camera2D.new()
	
	cam.current = true
	
	cam.name = "First Cam"
	add_child(cam)
	
	#var index : int = 0
	var index := 0 #shorthand for above. This assigns type and value in same line.
	
	while index < Triangle.polygon.size():
		print(Triangle.polygon[index])
#		index = index + 1
		index += 1 #shorthand for above
	
	

func _input(event):
	
	if event.is_action_pressed("move_cam_up"):
		cam_up = true
		cam_velocity.y = 300
	if event.is_action_released("move_cam_up"):
		cam_up = false
		cam_velocity.y = 0
	
	if event.is_action_pressed("move_cam_down"):
		cam_down = true
		cam_velocity.y = -300
	if event.is_action_released("move_cam_down"):
		cam_down = false
		cam_velocity.y = 0
		
	if event.is_action_pressed("move_cam_right"):
		cam_down = true
		cam_velocity.x = 300
	if event.is_action_released("move_cam_right"):
		cam_down = false
		cam_velocity.x = 0
	if event.is_action_pressed("move_cam_left"):
		cam_down = true
		cam_velocity.x = -300
	if event.is_action_released("move_cam_left"):
		cam_down = false
		cam_velocity.x = 0



func _process(delta : float):
	print(Triangle.name)
	print(Triangle.global_position)
	
	if cam_up == true:
		cam.position += cam_velocity * delta
	
	if cam_down == true:
		cam.position += cam_velocity * delta
	
	if cam_right == true:
		cam.position += cam.velocity * delta
	
	if cam_left == true:
		cam.position += cam.velocity * delta
	
	var Pivot := Triangle.global_position
	
	var index := 0
	
	while index < Triangle.polygon.size():
		
		print(Triangle.polygon[index])
		
		var point = Triangle.polygon[index] + Pivot
		
		if point.x >= boundary.x:
			Velocity.x = 0
		
		if point.y >= boundary.y:
			Velocity.y = 0
			
		index += 1
	
	
#	Triangle.global_position = Vector2(0,0) 
#	Triangle.global_position = Triangle.global_position + Velocity  reg=reg*reg aids


#	Triangle.global_position = lastposition + Velocity
#	lastposition = Triangle.global_position

	Triangle.global_position += Velocity * delta #short hand

#	cam.global_position = Triangle.global_position
