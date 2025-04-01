Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker myWalker = new Walker();
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //myWalker.position = new PVector(0, 300);
  //myWalker.g = 0;
  //myWalker.b = 0;
  //myWalker.mass = 5;
  //myWalker.scale = myWalker.mass * 10;
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].r = random(256);
    walkers[i].g = random(256);
    walkers[i].b = random(256);
    walkers[i].mass = i + 1;
    walkers[i].scale = walkers[i].mass * 10;
    
    float posX = -(2 * (Window.windowWidth/ walkers.length) * (i - (walkers.length / 2)));
    walkers[i].position = new PVector(posX, 300);
  }
}

void draw()
{
  background(255);
  
  ocean.render();
  
  for (Walker w : walkers)
  {
    w.render();
    w.update();
  
    // wind
    PVector wind = new PVector(0.1, 0);
    w.applyForce(wind);
  
    // gravity
    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);
    
    // drag force
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    
    // edge checker
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
    else if (w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }
    
    // collision with ocean
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
