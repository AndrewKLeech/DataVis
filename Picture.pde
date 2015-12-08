class Picture
{
  PImage img;
  int [] colors = new int[1];
  int count[] = new int[colors.length];
  float barWidth;
  int maxIndex;
  float max;
  float scale;
  boolean ranAmount = false;
  boolean ranGetColors = false;
  
  Picture(String file)
  {
      img = loadImage(file);
  }//End Picture()
  
  void barChart()
  {
      getColors();
      amount();
      barWidth = width / (float) colors.length;
      maxIndex = maxIndex(count);
      max = count[maxIndex];
      scale = height / max;
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
  }//End barChart
  
  void pixelSort()
  {
    //Makes sure count isnt added to every time pixelSort runs
      getColors();
      amount();
    
    //next is for going through the colors array
    int next = 0;
    //printed keeps track of the pixel position
    int printed = 0;
    for(int i = 0; i<img.pixels.length; i++)
    {
      //If there is an instance of this color print
      if(count[next]>0)
      {
        pixels[i]=colors[next];
      }//End if
      //When all pixels of color[next] is printed move to next color by increasing next by 1
      if(i-printed>count[next] && next<count.length-1)
      {
        //Change printed to next pixel start point
        printed = printed + count[next];
        next++;
      }//End if
    }//End for
    updatePixels();
  }//End pixelSort()
  
  void showPicture()
  {
    image(img, 0, 0);
  }//End showPicture()
  
  //Count amount of pixels for each color
  void amount()
  {
    if(ranAmount != true)
    {
      loadPixels(); 
      img.loadPixels(); 
      //Cycle through y and x coordinates
      for (int y = 0; y < height; y++) 
      {
        for (int x = 0; x < width; x++) 
        {
          //Get location of pixel
          int loc = x + y*width;
          for(int i = 0; i<colors.length; i++)
          {
            if(img.pixels[loc] == colors[i])
            {
              count[i]++;
            }//End if
          }//End for i
        }//End for x
      }//End for y
      ranAmount = true;
      }//End if
  }//End amount()
  
  
  
  void getColors()
  {
    if(ranGetColors != true)
    {
      loadPixels(); 
      img.loadPixels(); 
      //Cycle through y and x coordinates
      for (int y = 0; y < height; y++) 
      {
        for (int x = 0; x < width; x++) 
        {
          //Get location of pixel
          int loc = x + y*width;
          boolean exists = false;
          for(int i = 0; i<colors.length; i++)
          {
            if(img.pixels[loc] == colors[i])
            {
              exists = true;
              break;
            }//End if
          }//End for i
          if(exists == false)
          {
              colors = append(colors, img.pixels[loc]);
              count=append(count, 0);
          }
        }//End for x
      }//End for y
      ranGetColors = true;
      }//End if
      colors = sort(colors);
  }//End getColors()
}//End class
      
  
