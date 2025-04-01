// Walker myWalker = new Walker();
Walker walkers[] = new Walker[100];
boolean isInitialized = false;

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  
  return new PVector(x, y);
}

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // myWalker.acceleration = new PVector(-0.01, 0.1);
}

void draw()
{
  background(80);
  
  PVector mouse = mousePos();
  
  // Initializing walkers
  if (!isInitialized)
  {
    for(int i = 0; i < walkers.length; i++)
    {
      walkers[i] = new Walker();
    }  
    isInitialized = true;
  }
  
  for(int i = 0; i < walkers.length; i++)
    {
      walkers[i].acceleration = PVector.sub(mouse, walkers[i].position);
      walkers[i].acceleration.normalize().mult(0.2);
      // walkers[i].checkCollision(); // bounce function I added for fun
      walkers[i].update();
      walkers[i].render();
    }
}
