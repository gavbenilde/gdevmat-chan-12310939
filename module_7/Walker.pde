public class Walker {
  
  public PVector position = new PVector();
  public PVector velocity = new PVector(); 
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker()
  {
    // randomizers
    float xRng = random(-(1280/2), 1280/2);
    float yRng = random(-(720/2), 720/2);
    float scaleRng = random(10, 50);
    
    this.position.x = xRng;
    this.position.y = yRng;
    this.scale = scaleRng;
  }
  
  public void update()
  {
    // this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {    
    fill(100);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    else if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  
  public void checkCollision()
  {
    if (this.position.x > Window.right)
    {
      this.velocity.x *= -1;
    }
    else if (this.position.x < Window.left)
    {
      this.velocity.x *= -1;
    }
    else if (this.position.y > Window.top)
    {
      this.velocity.y *= -1;
    }
    else if (this.position.y < Window.bottom)
    {
      this.velocity.y *= -1;
    }
  }
}
