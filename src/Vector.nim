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


# # return the value in the vector at i 
# # you can call this as vec[1] or [vec,1], i think
# proc `[]`*(thingo:Vector3, i:int): float = 
#   if i == 0:
#     return thingo.x
#   elif i == 1:
#     return thingo.y
#   elif i == 2:
#     return thingo.z
#   else:
#     discard 


proc vec*(a,b,c:float): Vector3 = 
  return Vector3(x:a, y:b, z:c)

#-------------------------------------------------
#--------- VECTOR AND FLOAT MANIPULATION ---------
# multipy a vector by a float
proc `*`*(v: Vector3, f: float): Vector3 = 
  return Vector3(x: f * v.x, y: f * v.y, z: f * v.z)

proc `*`*(f: float, v: Vector3): Vector3 = 
  return Vector3(x: f * v.x, y: f * v.y, z: f * v.z)


# divide a vector by a float
proc `/`*(v: Vector3, f: float): Vector3 = 
  return Vector3(x: v.x/f, y: v.y/f, z: v.z/f)
#-------------------------------------------------
#------------- VECTOR FUNCTIONS ------------------
proc dot*(v1, v2: Vector3): float = 
  return ((v1.x * v2.x) + (v1.y * v2.y) + (v1.z * v2.z))

proc cross*(v1,v2: Vector3): Vector3 =
  return Vector3(x: (v1.y * v2.z - v1.z * v2.y),
                 y: (v1.x * v2.z - v1.z * v2.x),
                 z: (v1.x * v2.y - v1.y * v2.x)
                 )

proc length*(vec: Vector3): float = 
  return sqrt((vec.x * vec.x) + (vec.y * vec.y) + (vec.z * vec.z))

proc squaredLength*(vec: Vector3): float = 
  return ((vec.x * vec.x) + (vec.y * vec.y) + (vec.z * vec.z))

proc unit_vector*(v: Vector3): Vector3 = 
  return v / v.length
#-------------------------------------------------
#--------- VECTOR MANIPLUATION ------------------
# add two vectors 
proc `+`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x + v2.x, y: v1.y + v2.y, z: v1.z + v2.z)

# subtract two vectors 
proc `-`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x - v2.x, y: v1.y - v2.y, z: v1.z - v2.z)

# multiply two vectors 
proc `*`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x * v2.x, y: v1.y * v2.y, z: v1.z * v2.z)

# divide two vectors 
proc `/`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x / v2.x, y: v1.y / v2.y, z: v1.z / v2.z)

proc `+=`*(v1,v2: Vector3): Vector3 = 
  return Vector3(x: v1.x + v2.x,
                 y: v1.y + v2.y,
                 z: v1.z + v2.z)

# this may also be multiplying the vector with itself
# TODO: check if these functions are actually multipled by itself in implementaion 
proc `*=`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x * v2.x,
                 y: v1.y * v2.y,
                 z: v1.z * v2.z)

proc `/=`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x / v2.x,
                 y: v1.y / v2.y,
                 z: v1.z / v2.z)


proc `-=`*(v1,v2: Vector3): Vector3 =
  return Vector3(x: v1.x - v2.x,
                 y: v1.y - v2.y,
                 z: v1.z - v2.z)

proc `*=`*(v1: Vector3, t: float): Vector3 =
  return Vector3(x: v1.x * t,
                 y: v1.y * t,
                 z: v1.z * t)

proc `/=`*(v1: Vector3, k: float): Vector3 =
  var t = 1.0 / k
  return Vector3(x: v1.x * t,
                 y: v1.y * t,
                 z: v1.z * t)
#-------------------------------------------------