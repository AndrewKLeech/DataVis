PImage img;
int mode = 0;
color [] colors = {color(255,0,0),color(0,255,0),color(0,0,255),color(255,255,255),color(0,0,0)};//Red,blue,green,white,black

int count[] = new int[5];

void setup() 
{
  size(500, 500);
  img = loadImage("pic.jpg");
  amount();
}

void draw() 
{
  background(100);
  switch(mode)
  {
    case 0://Bar chart
    {
      float barWidth = width / (float) colors.length;
      int maxIndex = maxIndex(count);
      float max = count[maxIndex];    
      float scale = height / max;
      barWidth = width / (float) colors.length;
      //Print bars
      for (int i = 0 ; i < colors.length ; i ++)
      {
        float x = i * barWidth;
        float y = count[i] * scale;
        float col = map(y, 0, max * scale, 255, 100);
        stroke(colors[i]);
        fill(colors[i]);        
        rect(x, height, barWidth - 1, - y);
      }//End for
      break;
    }//End case 0
   
    
    case 1:
    {
      int next = 0;
      int printed = 0;
      for(int i = 0; i<img.pixels.length; i++)
      {
        pixels[i]=colors[next];
        if(i-printed>count[next] && next<4)
        {
          printed = printed + count[next];
          next++;
        }
      }
      updatePixels();
      break;
    }
    
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

void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  println(mode);
}

void amount()
{
  loadPixels(); 
  img.loadPixels(); 
  for (int y = 0; y < height; y++) 
  {
    for (int x = 0; x < width; x++) 
    {
      int loc = x + y*width;
      
      //Get RGB values
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      //White
      if(r > 201 && g>201 && b>201)
      {
        count[3]++;
      }
      //Red
      if(r>=200)
      {
        count[0]++;
      }
      //Green
      if(g >= 200)
      {
        count[1]++;
      }
      //Blue
      if(b>= 200)
      {
        count[2]++;
      }
      //Black
      if(r < 50 && g<50 && b<50)
      {
        count[4]++;
      }        
    }//End for
  }//End for
}
