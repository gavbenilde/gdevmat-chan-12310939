void setup ()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();
Walker biasedWalker = new Walker();

void draw()
{
  int rng = int(random(5));
  int colorRngR = int(random(256));
  int colorRngG = int(random(256));
  int colorRngB = int(random(256));
  int alphaRng = int(random(50, 101));
  
  fill(colorRngR, colorRngG, colorRngB, alphaRng);
  myWalker.randomWalk();
  myWalker.render();
  
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
}
