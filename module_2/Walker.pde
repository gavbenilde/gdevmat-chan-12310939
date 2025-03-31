class Walker
{
  float x;
  float y;
  
  void render()
  {
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y+=10;
    }
    else if (rng == 1)
    {
      y-=10;
    }
    else if (rng == 2)
    {
      x+=10;
    }
    else if (rng == 3)
    {
      x-=10;
    }
    else if (rng == 4)
    {
      x+=10;
      y+=10;
    }
    else if (rng == 5)
    {
      x+=10;
      y-=10;
    }
    else if (rng == 6)
    {
      x-=10;
      y+=10;
    }
    else if (rng == 7)
    {
      x-=10;
      y-=10;
    }
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(100));
    
    if (rng >= 0 && rng <= 29)
    {
      y+=10;
    }
    else if (rng >= 30 && rng <= 39)
    {
      y-=10;
    }
    else if (rng >= 40 && rng <= 44)
    {
      x+=10;
    }
    else if (rng >= 45 && rng <= 64)
    {
      x-=10;
    }
    else if (rng >= 65 && rng <= 69)
    {
      x+=10;
      y+=10;
    }
    else if (rng >= 70 && rng <= 79)
    {
      x+=10;
      y-=10;
    }
    else if (rng >= 80 && rng <= 84)
    {
      x-=10;
      y+=10;
    }
    else if (rng >= 85 && rng <= 99)
    {
      x-=10;
      y-=10;
    }
  }
}
