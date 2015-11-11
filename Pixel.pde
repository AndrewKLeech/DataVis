PImage img;

color [] colors = {color(255,0,0),color(0,255,0),color(0,0,255),color(255,255,255),color(0,0,0)};

void setup() 
{
  size(500, 500);
  img = loadImage("pic.jpg");
  background(100);
}

void draw() {
  loadPixels(); 
  img.loadPixels(); 
  int count[] = new int[5];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      
      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      if(r >= 200 && r<=255)
      {
        count[0]++;
      }
      if(g >= 200 && g<=255)
      {
        count[1]++;
      }
      if(r == 0 && g==0 && b>= 200 && b<=255 )
      {
        count[2]++;
      }
      if(r > 201 && g>201 && b>201)
      {
        count[3]++;
      }
      if(r < 50 && g<50 && b<50)
      {
        count[4]++;
      }        
    }
  }
      float barWidth = width / (float) colors.length;
      int maxIndex = maxIndex(count);
      float max = count[maxIndex];    
      float scale = height / max;
      barWidth = width / (float) colors.length;
      for (int i = 0 ; i < colors.length ; i ++)
      {
        float x = i * barWidth;
        float y = count[i] * scale;
        float col = map(y, 0, max * scale, 255, 100);
        stroke(colors[i]);
        fill(colors[i]);        
        rect(x, height, barWidth - 1, - y);
      }
      
}

int maxIndex(int[] count)
{
  float max = count[0];
  int maxIndex = 0;
  for (int i = 1 ; i < count.length ; i ++)
  {
    if (count[i] > max)
    {
      max = count[i];
      maxIndex = i;
    }
  }
  return maxIndex;
}
