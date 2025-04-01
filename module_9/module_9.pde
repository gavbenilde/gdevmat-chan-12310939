// Walker walker = new Walker();
Walker walkers[] = new Walker[8];

// PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass = i + 2;
    walkers[i].scale = walkers[i].mass * 15;
    
    float posY = 2 * (Window.windowHeight/ walkers.length) * (i - (walkers.length / 2));
    walkers[i].position = new PVector(-500, posY);
  }
}

void draw()
{
  background(255);
  
  if (mousePressed == true)
  {
    setup();
  }
  
  // middle line
  line(0, -Window.windowHeight, 0, Window.windowHeight);
  
  for (Walker w : walkers)
  {
    float mew = 0.01f;
    
    // going past midpoint increases friction coefficient
    if (w.position.x >= 0)
    {
      mew = 0.4f;
    }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    // PVector gravity = new PVector(0, -0.15 * w.mass);
    PVector acceleration = new PVector(0.2 / w.mass, 0); // bonus application of mass (?)
    
    w.render();
    w.update();
    w.applyForce(acceleration);
    
    // w.applyForce(gravity);
    w.checkEdges();
  }
}
