const
  # if changing the image dimensions, make sure both the 
  # width and height can be evenly divided by 20
  imageX*: int = 200
  imageY*: int = 100
  numChunks*: int = 20
  chunkX*: int = imageX div numChunks
  chunkY*: int = imageY div numChunks
  maxRayBounce*: int = 3