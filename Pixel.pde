import controlP5.*;
import java.util.*;
ControlP5 cp5;

ArrayList<Picture>pictures = new ArrayList<Picture>();
int mode = 2;//Start in display orignal image option
int imageInUse = 0;
void setup() 
{
  //Load data(image files)
  Picture pic = new Picture("pic1.png");
  pictures.add(pic);
  pic = new Picture("pic2.png");
  pictures.add(pic);
  pic = new Picture("pic3.jpg");
  pictures.add(pic);
  pic = new Picture("pic4.png");
  pictures.add(pic);
  size(pictures.get(0).img.width, pictures.get(0).img.height);
  
  //Menu size and color
  float menuHeight = 500/*change to image height*/ * 0.05f;
  color idle = color(255,0,0,50);
  color hover = color(0,0,200,50);
  color clicked = color(90,50,255,125);
  float dropDownWidth = width/*change to image width*/ * 0.1f;
  float buttonBarWidth = width/*change to image width*/ - dropDownWidth;
  
  //ButtonBar set up
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize((int)buttonBarWidth, (int)menuHeight)
     .addItems(split("a b c"," "))
     .setColorForeground(idle) 
     .setColorBackground(hover)
     .setColorActive(clicked)
     ;
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
  
  //DropDown menu set up
  cp5 = new ControlP5(this);
  List l = Arrays.asList("Pic 1", "Pic 2", "Pic 3", "Pic 4");
  cp5.addScrollableList("select")
     .setPosition(width-dropDownWidth, 0)
     .setSize((int)dropDownWidth, 100)
     .setBarHeight((int)menuHeight)
     .setItemHeight(20)
     .addItems(l)
     .setColorForeground(idle) 
     .setColorBackground(hover)
     .setColorActive(clicked)
     ;
}//End setup()

//Get drop down list item selected
void select(int n) 
{
  imageInUse = n;
}//End select()

//Get button pressed
void bar(int n) 
{
  mode = n;
}//End bar

void draw() 
{
  background(100);
  
  //Switch for button pressed
  switch(mode)
  {
    case 0://Bar Chart
    {
      pictures.get(imageInUse).barChart();
      break;
    }//End case 0 Bar Chart
    
    case 1://Sort Pixels
    {
      pictures.get(imageInUse).pixelSort();
      break;
    }//End case 1 Sort Pixels
    
    case 2://Display Orignal Image
    {
      pictures.get(imageInUse).showPicture();
      break;
    }//End case 2 Display Orignal Image
  }//End switch(mode)
}//End draw

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
