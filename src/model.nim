# define a bunch of models that can be in the image
import ./vector,
      ./ray,
      math

type
  Effects* = object
    glow: bool

  Sphere* = object
    radius*: float
    center*: Vector3 # also could be called the origin
    effects*: Effects # define the spheres properties
  



# create a sphere object
proc CreateSphere*(origin: Vector3, size: float): Sphere =
  return Sphere(radius: size, center: origin)

proc doesHitSphere*(r:Ray,sphere:Sphere): float = 
  var
    oc: Vector3 = r.origin - sphere.center
    a: float = dot(r.direction(), r.direction())
    b: float = 2.0 * dot(oc, r.direction())
    c: float = dot(oc,oc) - (sphere.radius * sphere.radius)
    discriminant = b*b - 2*a*c # quadratic formula?
  
  if discriminant < 0.0:
    return -1.0
  else:
    return (-b - sqrt(discriminant) / (2.0*a))
