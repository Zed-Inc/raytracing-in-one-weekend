# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import ./Vector

const
  # if changing the image dimensions, make sure both the 
  # width and height can be evenly divided by 20
  imageX: int = 1920
  imageY: int = 1080
  numChunks: int = 20
  chunkX: int = imageX div numChunks
  chunkY: int = imageY div numChunks





