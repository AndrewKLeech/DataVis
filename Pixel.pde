import controlP5.*;
ControlP5 cp5;

ArrayList<Picture>pictures = new ArrayList<Picture>();
int mode = 2;//Start in display orignal image option
void setup() 
{
  Picture pic = new Picture("pic4.png");
  pictures.add(pic);
  pic = new Picture("pic2.jpg");
  pictures.add(pic);
  size(500, 500);
  //amount();
  
  //Menu size and color
  float menuHeight = 500/*change to image height*/ * 0.05f;
  color idle = color(255,0,0,50);
  color hover = color(0,0,200,50);
  color clicked = color(90,50,255,125);
  //Menu set up
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(500/*change to image width*/, (int)menuHeight)
     .addItems(split("a b c"," "))
     .setColorForeground(idle) 
     .setColorBackground(hover)
     .setColorActive(clicked)
     ;
     println(b.getItem("a"));
  b.changeItem("a","text","Bar Chart");
  b.changeItem("b","text","Pixel Sort");
  b.changeItem("c","text","Image");
  b.onMove(new CallbackListener()
  {
    public void controlEvent(CallbackEvent ev) 
    {
      ButtonBar bar = (ButtonBar)ev.getController();
    }
  });
}//End setup()

void bar(int n) {
  mode = n;
}

void draw() 
{
  background(100);
  switch(mode)
  {
    case 0://Bar Chart
    {
    pictures.get(0).barChart();
     break;
    }//End case 1 Bar Chart
    
    case 1://Sort Pixels
    {
      pictures.get(0).pixelSort();
      break;
    }//End case 2 Sort Pixels
    
    case 2://Display Orignal Image
    {
     pictures.get(0).showPicture();
     break;
    }//End case 2 Display Orignal Image
  }//End switch(mode)
}//End draw



void keyPressed()
{
  //Change mode
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }//End if
}//End keyPressed()



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
    }//End if
  }//End for
  return maxIndex;
}//End maxIndex()
