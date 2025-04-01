//timers and counters
int n;
int a = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(0);
  
  for (int i = 0; i < matter.length; i++) 
    {
       matter[i] = new Walker();
    }
}

Walker blackHole = new Walker();
Walker[] matter = new Walker[100];

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  
  return new PVector(x, y);
}

void draw()
{
  // ==============================================================
  // INITIALIZATION AND SPAWNING
  // random logic
  float gaussian = randomGaussian();
  float scaleGaussian = randomGaussian();
  float xRng = random(-(1280/2), (1280/2)+1); 
  float yRng = random(-(720/2), (720/2)+1); 
  float colorRngR = random(256);
  float colorRngG = random(256);
  float colorRngB = random(256);
   
  float standardDeviation = Window.windowWidth;
  float mean = 0;
  float scaleStandardDeviation = 20;
  float scaleMean = 10;
  
  float x = standardDeviation * gaussian + mean;
  float y = yRng;
  float thickness = scaleStandardDeviation * scaleGaussian + scaleMean;
  
  // initialization for bonus mouse black hole
  PVector mouse = mousePos();
  
  // initializing colors, thickness, and positions before rendering
  // other matter
  if (a < 99)
  { 
    matter[a].position.x = x;
    matter[a].position.y = y;
    matter[a].scale = thickness;
    
    matter[a].colR = colorRngR; 
    matter[a].colG = colorRngG; 
    matter[a].colB = colorRngB; 
    
    a++;
  }
 
  // render all matter and one (1) black hole
  if (a == 99)
  {
    for(int i = 0; i < 100; i++)
    {
      matter[i].render();
    }
    
    // black hole
    blackHole.position.x = xRng;
    blackHole.position.y = yRng;
    blackHole.scale = 50;
    blackHole.colR = blackHole.colG = blackHole.colB = 255.;
  
    // render black hole...
    blackHole.render();
    a++;
  }  
  // ==============================================================
  
  // buffer for each iteration using n time
  if (a == 100 && n >= 199)
   {
     background(0);
     a = 0;
     n = 0;
   }
   else if (a == 100)
   {
     background(0);
     
     // movement into the black hole
     for(int i = 0; i < 100; i++)
      {
        matter[i].speed = PVector.sub(blackHole.position, matter[i].position);
        matter[i].speed.normalize().mult(10);
        
        matter[i].move();
        matter[i].render();
      }
      
      // follows mouse cursor (comment line 110 - 111 to see randomized positions)
      blackHole.position.x = mouse.x;
      blackHole.position.y = mouse.y;
      blackHole.render();
     
      // n time ticks up
      n++;
   }
  
  // strokeWeight(5);
  // stroke(255, 0, 0);
  
  // bonus
  // PVector mouse = mousePos();
  
  
}
