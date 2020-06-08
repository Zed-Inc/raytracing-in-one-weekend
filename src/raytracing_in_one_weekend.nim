# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import ./vector,
      ./helperFunctions,
      ./ray,
      ./model

import strformat

#----- FORWARD DECLARATION -------
proc chunkTrace()
proc colour(r: Ray): Vector3

const
  # if changing the image dimensions, make sure both the 
  # width and height can be evenly divided by 20
  imageX: int = 960
  imageY: int = 540
  numChunks: int = 20
  chunkX: int = imageX div numChunks
  chunkY: int = imageY div numChunks
  maxRayBounce: int = 3
  Camera: Vector3 = Vector3(x: 0.0, y: 0.0, z: 0.0)
  


let
  nx = imageX
  ny = imageY

#[
  -- Notes --
  Y axis goes up 
  X axis goes to the right 
  Z axis goes negative the further it moves into the screen(away from the camera)
  so the point (0,0,0) is the bottom left corner 
  point (50,50,-50) is near the bottom left corner and goes 50 pixels into the screen

]#
var
  lower_left_corner = Vector3(x: -2.0, y: -1.0, z: -1.0)
  horizontal = Vector3(x: 4.0, y: 0.0, z: 0.0)
  vertical = Vector3(x:0.0, y: 2.0, z: 0.0)
  # origin = Vector3(x:0.0, y:0.0, z:0.0)

print("P3\n" & $nx & " " & $ny & "\n255\n")
for j in countdown(ny-1,0):
  for i in 0..nx:
    var 
      u   = float(i) / float(nx)
      v   = float(j) / float(ny)
      r   = ray(Camera, lower_left_corner + u*horizontal + v*vertical)
      col = colour(r)
      ir  = int(255.99 * col.x)
      ig  = int(255.99 * col.y)
      ib  = int(255.99 * col.z)
      
    echo fmt"{$ir} {$ig} {$ib}"

# it's color
proc colour(r: Ray): Vector3 =
  var sphere = CreateSphere(vec(0.0,0.0,-1.0), 0.5)
  # check if the ray hit the sphere, if so return a red value
  if bool(doesHitSphere(r,sphere)):
    return vec(1,0,0)
  
  var
    unit_direction = unit_vector(r.direction()) 
    t: float = 0.5*(unit_direction.y+1.0) #doesHitSphere(r, sphere)
  return ((1.0 - t) * vec(1.0,1.0,1.0) + t*vec(0.5,0.7,1.0))
  


# break the image into chunks, multi-thread the raytracing of each chunk 
proc chunkTrace() =
  echo "chunk trace"
