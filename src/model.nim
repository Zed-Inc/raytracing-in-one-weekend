# define some structures for the renderer to use

import ./vector,
      ./ray,
      math,
      ./constants



type
  # store all the pixel information for the image here
  Image* = object
    # store the original image pixels
    ogPixels*: array[imageX*imageY, (float,float,float)]
    # store the edited pixels, this array is what will be blitted to the screen
    editPixels*: array[imageX*imageY, (float,float,float)]
    # store the chunks of the image
    # chunk[1][1][1] this is the first chunks pixel at (1,1)
    chunk*: array[numChunks, array[chunkY,array[chunkX, (float,float,float)]]]


  Effects* = object
    glow: bool
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
