void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  // strokeWeight(5);
  // stroke(255, 0, 0);
  
  PVector mouse = mousePos();
  
  // lightsaber outer glow
  strokeWeight(8);
  stroke(255, 0, 0);
  
  mouse.normalize().mult(450);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // printing the magnitude
  println(mouse.mag());
  
  // lightsaber inner glow
  strokeWeight(4);
  stroke(255);
  
  mouse.normalize().mult(445);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // lightsaber handle
  strokeWeight(8);
  stroke(0);
  
  mouse.normalize().mult(100);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
}
