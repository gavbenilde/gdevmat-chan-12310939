class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(10, 8);
  
  void render()
  {
    fill(182, 52, 100);
    circle(position.x, position.y, 30);
  }
  
  void moveAndBounce()
  {
    position.add(speed);
    
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      position.y+=speed.y;
    }
    else if (rng == 1)
    {
      position.y-=speed.y;
    }
    else if (rng == 2)
    {
      position.x+=speed.x;
    }
    else if (rng == 3)
    {
      position.x-=speed.x;
    }
    else if (rng == 4)
    {
      position.x+=speed.x;
      position.y+=speed.y;
    }
    else if (rng == 5)
    {
      position.x+=speed.x;
      position.y-=speed.y;
    }
    else if (rng == 6)
    {
      position.x-=speed.x;
      position.y+=speed.y;
    }
    else if (rng == 7)
    {
      position.x-=speed.x;
      position.y-=speed.y;
    }
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(100));
    
    if (rng >= 0 && rng <= 29)
    {
      position.y+=speed.y;
    }
    else if (rng >= 30 && rng <= 39)
    {
      position.y-=speed.y;
    }
    else if (rng >= 40 && rng <= 44)
    {
      position.x+=speed.x;
    }
    else if (rng >= 45 && rng <= 64)
    {
      position.x-=speed.x;
    }
    else if (rng >= 65 && rng <= 69)
    {
      position.x+=speed.x;
      position.y+=speed.y;
    }
    else if (rng >= 70 && rng <= 79)
    {
      position.x+=speed.x;
      position.y-=speed.y;
    }
    else if (rng >= 80 && rng <= 84)
    {
      position.x-=speed.x;
      position.y+=speed.y;
    }
    else if (rng >= 85 && rng <= 99)
    {
      position.x-=speed.x;
      position.y-=speed.y;
    }
  }
}
