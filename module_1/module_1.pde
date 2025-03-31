// color variables
color white = color(255, 255, 255);
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color yellow = color(255, 255, 0);
color purple = color(255, 0, 255);
color cyan = color(0, 255, 255);

// variables for sine wave (+bonus)
float time = 0;
float frequency = 0.5; // default frequency of 1
float amplitude = 30; // default amplitude of 1

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D); // set window size to 1280 x 720
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

// the function that gets called every frame
void draw()
{
  background(0); // sets the background color of the whole window
  
  //circle(0, 0, 15); // draws a circle at x,y with thickness
  
  //strokeWeight(2); // changes the thickness of the line below it
  //color white = color(255, 255, 255); // declare a color variable
  //fill(white); // fills with the color selected
  //stroke(white); // all strokes will be with the color selected
  //line (-75, -75, 75, 75); // draws a line x1, y1, x2, y2
  
  drawCartesianPlane();
  //drawLinearFunction();
  //drawQuadraticFunction();
  //drawCircle();
  
  // #1 and #2
  drawFunction1();
  drawFunction2();
  
  // sine wave logic
  time+=20; // time to move the sine wave
  
  if (time >= 500) // loop the sine wave anim to translate endlessly
  {
    time = 0;
  }
  
  drawSineWave(); 
}

void keyPressed()
{
  // amplitude changes
    if (keyCode == UP) // up arrow increases amplitude by 1
    {
      amplitude++;
    }
    else if (keyCode == DOWN) // down arrow decreases amplitude by 1
    {
      amplitude--;
    }
    // frequency changes
    else if (keyCode == RIGHT) // right arrow increases frequency by 0.1
    {
      frequency += 0.1;
    }
    else if (keyCode == LEFT) // left arrow decreases frequency by 0.1
    {
      frequency -= 0.1;
    }
}

void drawFunction1()
{
  /*
    f(x) = x^2 - 15x - 3
  */
  
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) - (x * 15) - 3, 5);
  }
}

void drawFunction2()
{
  /*
    f(x) = -5x + 30
  */
  
  fill(purple);
  noStroke();
  
  for (float x = -200; x <= 200; x+=0.1f)
  {
    circle(x, (x * -5) + 30, 5);
  }
}

void drawSineWave()
{
  fill(cyan);
  stroke(cyan);
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x * 5 + time, (float)Math.sin(x * frequency) * amplitude, 5);
  }
}

void drawCartesianPlane()
{
  strokeWeight(1);
  fill(white);
  stroke(white);
  line(-300, 0, 300, 0);
  line(0, -300, 0, 300);
  
  for(int i = -300; i <= 300; i += 10)
  {
    line(i, -3, i, 3);
    line (-3, i, 3, i);
  } 
}

//void drawLinearFunction()
//{
//  /*
//    f(x) = x + 2
//    Let x be 4, then y = 6 (4,6);
//    Let x be -5, then y = -3 (-5, -3);
//  */
  
//  fill(red);
//  noStroke();
  
//  for (int x = -200; x <= 200; x++)
//  {
//    circle(x, x + 2, 5);
//  }
//}

//void drawQuadraticFunction()
//{
//  /*
//    f(x) = x^2 + 2x - 5
//    Let x be 2, then y = 3
//    Let x be -1, then y = -6
//  */
  
//  fill(green);
//  stroke(green);
  
//  for (float x = -300; x <= 300; x+=0.1f)
//  {
//    circle(x * 10, (float)Math.pow(x, 2) + (x * 2) - 5, 5);
//  }
//}

//void drawCircle()
//{
//  fill(blue);
//  stroke(blue);
//  float radius = 50;
  
//  for (int x = 0; x <= 360; x++)
//  {
//    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
//  }
//}
