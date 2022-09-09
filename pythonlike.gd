extends Control

var Velocity : Vector2 

var lastposition : Vector2

@export var Triangle : Node2D



func _ready():
	print("Hello World") 
	print(Triangle.name)
	Velocity.x = 1
	lastposition = Triangle.global_position
	

func _process(delta : float):
	print(Triangle.name)
	print(Triangle.global_position)
	
#	Triangle.global_position = Vector2(0,0) 
#	Triangle.global_position = Triangle.global_position + Velocity  reg=reg*reg aids


#	Triangle.global_position = lastposition + Velocity
#	lastposition = Triangle.global_position

#	Triangle.global_position+=Velocity  short hand
