import math

# this file includes all functions related to vector mathmatics
type
  # basic vector object stores 3 floats
  Vector3* = object
    x*: float
    y*: float
    z*: float

# store a colour 
  Color* = object
    r*: float
    g*: float
    b*: float


proc length*(vec: Vector3): float = 
  return sqrt((vec.x * vec.x) + (vec.y * vec.y) + (vec.z * vec.z))

proc squaredLength*(vec: Vector3): float = 
  return ((vec.x * vec.x) + (vec.y * vec.y) + (vec.z * vec.z))

# return the value in the vector at i 
# you can call this as vec[1] or [vec,1], i think
proc `[]`*(thingo:Vector3, i:int): float = 
  if i == 0:
    return thingo.x
  elif i == 1:
    return thingo.y
  elif i == 2:
    return thingo.z
  else:
    discard 

# add two vectors together
proc `+`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x + v2.x, y: v1.y + v2.y, z: v1.z + v2.z)
# proc makeUnitVector*(vec: Vector3) =
