# define a bunch of models that can be in the image
import ./vector,
      ./ray,
      math


const
  imageX: int = 200
  imageY: int = 100
  numChunks: int = 20
  chunkX: int = imageX div numChunks
  chunkY: int = imageY div numChunks

type
  Effects* = object
    glow: bool

  Image* = object
  # store the pixels of the image 
    pixels*: array[imageX*imageY, (float,float,float)]
    # store the chunks of the image
    # chunk[1][1][1] this is the first chunks pixel at x:1,y:1 
    chunk*: array[numChunks, array[chunkY,array[chunkX, float]]]

  Sphere* = object
    radius*: float
    center*: Vector3 # also could be called the origin
    # effects*: Effects # define the spheres properties
  



# create a sphere object
proc CreateSphere*(origin: Vector3, r: float): Sphere =
  return Sphere(radius: r, center: origin)

proc doesHitSphere*(r:Ray,sphere:Sphere): bool = 
  var
    oc: Vector3 = r.origin() - sphere.center
    a: float = dot(r.direction(), r.direction())
    b: float = 2.0 * dot(oc, r.direction())
    c: float = dot(oc,oc) - sphere.radius * sphere.radius
    discriminant = b*b - 4*(a*c)
  return (discriminant > 0) # this will either be true or false
