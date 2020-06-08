# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import ./vector,
      ./helperFunctions,
      ./ray,
      ./model,
      ./constants

import strformat, arraymancer

#----- FORWARD DECLARATION -------
proc chunkTrace(p: var Image)
proc colour(r: Ray): Vector3

const Camera: Vector3 = Vector3(x: 0.0, y: 0.0, z: 0.0)
  


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
  var sphere = CreateSphere(vec(0,0,-1), 0.5)
  # check if the ray hit the sphere, if so return a red value
  if doesHitSphere(r,sphere):
    return vec(1,0,0)
  var unit_direction = unit_vector(r.direction()) 
  var t: float = 0.5*(unit_direction.y + 1.0) #doesHitSphere(r, sphere)

  return ((1.0 - t) * vec(1.0,1.0,1.0)) + (t * vec(0.5,0.7,1.0))
  


# break the image into chunks, multi-thread the raytracing of each chunk 
proc chunkTrace(p: var Image) =
  echo "doing the chunk trace"
  #[
    arc compiler, locks, experimental feature parralel 
    1. seperate all the pixels into their chunks
      TODO: convert chunks to Tensors
    2. Seperate the chunks into n threads where n is the number of chunks 
    3. apply the raytracing features to all chunks, all threads have access to
       original pixel array for manipulation 

    i am directly editing the parameter passed in, this allows for me to no
  ]#


  var pixelPos: int = 0 # the cursor position in the pixels
  var pixelStop: int = pixelPos + (chunkX * chunkY) # Where the chunk end stops 
  var pixelendPos: int = imagex * imageY # the maximum array bounds

  # 1. seperate pixels into chunks
  for c in 0..<numChunks:
    for i in 0..<chunkY:
      for j in 0..<chunkX:
        for k in pixelPos..<pixelStop:
          p.chunk[c][i][j] = p.ogPixels[k]
        #----
        # check we're not breaking any array boundaries
        if pixelStop + (pixelPos + (chunkX * chunkY)) >= pixelendPos:
          pixelStop = pixelendPos
      #----
    #----
  #----

