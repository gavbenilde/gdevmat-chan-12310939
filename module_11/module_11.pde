//Walker bigMatter = new Walker();
//Walker smallMatter = new Walker();
Walker walkers[] = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    float posX = random(Window.left, Window.right);
    float posY = random(Window.bottom, Window.top);
    
    walkers[i].position = new PVector(posX, posY);
    walkers[i].mass = random(1, 15);
    walkers[i].scale = walkers[i].mass * 10;
  }
}

void draw()
{
  background(255);
  noStroke();
  
  //for (Walker i : walkers)
  //{
  //  for (Walker j: walkers)
  //  {
  //    if (i != j)
  //    {
  //      i.update();
  //      i.render();
        
  //      i.applyForce(j.calculateAttraction(i));
  //    }
  //  }
  //}
  
  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (walkers[i] != walkers[j])
      {
        walkers[i].update();
        walkers[i].render();
        
        walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
      }
    }
  }
  
}
