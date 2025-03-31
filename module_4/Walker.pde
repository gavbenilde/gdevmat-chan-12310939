public class Walker
{
  public float x;
  public float y;
  public float thickness;
  public float tx = 0, ty = 10000;
  public float tThicc = 25;
  
  public float colR = 255;
  public float colG = 255;
  public float colB = 255;
  public float tR = 100, tG = 30, tB = 10;
  
  void render()
  {
    fill(colR, colG, colB);
    circle(x, y, thickness);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    thickness = map(noise(tThicc), 0, 1, 5, 150);
    colR = map(noise(tR), 0, 1, 0, 255);
    colG = map(noise(tG), 0, 1, 0, 255);
    colB = map(noise(tB), 0, 1, 0, 255);
    
    tx += 0.01f;
    ty += 0.01f;
    tThicc += 0.01f;
    tR += 0.01f;
    tG += 0.01f;
    tB += 0.01f;
  }
}
