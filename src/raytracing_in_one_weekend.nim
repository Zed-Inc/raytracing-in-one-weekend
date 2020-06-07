# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import ./vector,
      ./helperFunctions

import strformat

const
  # if changing the image dimensions, make sure both the 
  # width and height can be evenly divided by 20
  imageX: int = 1920
  imageY: int = 1080
  numChunks: int = 20
  chunkX: int = imageX div numChunks
  chunkY: int = imageY div numChunks

let
  nx = 200
  ny = 100

print("P3\n" & $nx & " " & $ny & "\n255\n")

for j in countdown(ny-1,0):
  for i in 0..nx:
    var 
      col = Vector3(x: float(i) / float(nx),y: float(j) / float(ny), z: 0.2)
      ir  = int(255.99 * col.x)
      ig  = int(255.99 * col.y)
      ib  = int(255.99 * col.z)
      
    echo fmt"{$ir} {$ig} {$ib}"

