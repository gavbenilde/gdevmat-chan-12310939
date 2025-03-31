int flushTimer = 0;

void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  float gaussian = randomGaussian();
  float scaleGaussian = randomGaussian();
  float rng = random(-(720/2), (720/2)+1); 
  float colorRngR = random(256);
  float colorRngG = random(256);
  float colorRngB = random(256);
  float alphaRng = random(10, 101);
  
  if (flushTimer >= 300)
  {
    background(255);
    flushTimer = 0;
  }
  
  // bonus timer
  flushTimer++;
  
  float standardDeviation = 100;
  float mean = 0;
  float scaleStandardDeviation = 50;
  float scaleMean = 20;
  
  float x = standardDeviation * gaussian + mean;
  float y = rng;
  float thickness = scaleStandardDeviation * scaleGaussian + scaleMean;
  
  noStroke();
  fill(colorRngR, colorRngG, colorRngB, alphaRng);
  circle(x, y, thickness);
}
