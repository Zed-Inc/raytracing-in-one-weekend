

import ./vector


# all ray methods are implemented here

#[
  ray as a function of t
  p(t) = A + t * B
  A = the ray origin
  B = the ray direction
  and t is a real number(float in code)

]#



type
  Ray* = object
    A*: Vector3 # ray origin
    B*: Vector3 # ray direction

# creates a ray
proc ray*(a,b:Vector3): Ray = 
  return Ray(A: a, B: b)


# return the vector at point t on the ray
proc point_at_parameter*(A,B: Vector3, t: float): Vector3 = 
  return A + (t*B)

# return the vector that is the origin of the ray 
proc origin*(r: Ray): Vector3 =
  return r.A

# return the vector that is the direction of the ray
proc direction*(r: Ray): Vector3 = 
  return r.B