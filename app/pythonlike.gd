extends Control

var Velocity : Vector2 

var lastposition : Vector2

@export var Triangle : Node2D

var boundary : Vector2i

func _ready():
	print("Hello World") 
	print(Triangle.name)
	Velocity.x = 100
	Velocity.y = 25
	lastposition = Triangle.global_position
	get_tree().get_root() # access via scenemainloop
	print(get_tree().get_root().size)
	boundary.x = 700 #1152 base
	boundary.y = 348 #648 base

func _process(delta : float):
	print(Triangle.name)
	print(Triangle.global_position)
	if Triangle.global_position.x >= boundary.x or Triangle.global_position.y >= boundary.y:
		Velocity.x = 0
		Velocity.y = 0
	
	
#	Triangle.global_position = Vector2(0,0) 
#	Triangle.global_position = Triangle.global_position + Velocity  reg=reg*reg aids


#	Triangle.global_position = lastposition + Velocity
#	lastposition = Triangle.global_position

	Triangle.global_position += Velocity * delta #short hand
