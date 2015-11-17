import controlP5.*;

ControlP5 cp5;
PImage img;
int mode = 2;//Start in display orignal image option
color [] colors = {
                   /*0 maroon*/                  color(128,0,0),
                   /*1 dark red*/                color(139,0,0),
                   /*2 brown*/                   color(165,42,42),
                   /*3 firebrick*/               color(178,34,34),
                   /*4 crimson*/                 color(220,20,60),
                   /*5 red*/                     color(255,0,0),
                   /*6 tomato*/                  color(255,99,71),
                   /*7 coral*/                   color(255,127,80),              
                   /*8 indian red*/              color(205,92,92),
                   /*9 light coral*/             color(240,128,128),
                   /*10 dark salmon*/            color(233,150,122),
                   /*11 salmon*/                 color(250,128,114),
                   /*12 light salmon*/           color(255,160,122),
                   /*13 orange red*/             color(255,69,0),
                   /*14 dark orange*/            color(255,140,0),
                   /*15 orange*/                 color(255,165,0),
                   /*16 gold*/                   color(255,215,0),
                   /*17 dark golden rod*/        color(184,134,11),
                   /*18 golden rod*/             color(218,165,32),
                   /*19 pale golden rod*/        color(238,232,170),
                   /*20 dark khaki*/             color(189,183,107),
                   /*21 khaki*/                  color(240,230,140),
                   /*22 olive*/                  color(128,128,0),
                   /*23 yellow*/                 color(255,255,0),
                   /*24 yellow green*/           color(154,205,50),
                   /*25 dark olive green*/       color(85,107,47),
                   /*26 olive drab*/             color(107,142,35),
                   /*27 lawn green*/             color(124,252,0),
                   /*28 chart reuse*/            color(127,255,0),
                   /*29 green yellow*/           color(173,255,47),
                   /*30 dark green*/             color(0,100,0),
                   /*31 green*/                  color(0,128,0),
                   /*32 forest green*/           color(34,139,34),
                   /*33 lime*/                   color(0,255,0),
                   /*34 lime green*/             color(50,205,50),
                   /*35 light green*/            color(144,238,144),
                   /*36 pale green*/             color(152,251,152),
                   /*37 dark sea green*/         color(143,188,143),
                   /*38 medium spring green*/    color(0,250,154),
                   /*39 spring green*/           color(0,255,127),
                   /*40 sea green*/              color(46,139,87),
                   /*41 medium aqua marine*/     color(102,205,170),
                   /*42 medium sea green*/       color(60,179,113),
                   /*43 light sea green*/        color(32,178,170),
                   /*44 dark slate gray*/        color(47,79,79),
                   /*45 teal*/                   color(0,128,128),
                   /*46 dark cyan*/              color(0,139,139),
                   /*47 aqua*/                   color(0,255,255),
                   /*48 cyan*/                   color(0,255,255),
                   /*49 light cyan*/             color(224,255,255),
                   /*50 dark turquoise*/         color(0,206,209),
                   /*51 turquoise*/              color(64,224,208),
                   /*52 medium turquoise*/       color(72,209,204),
                   /*53 pale turquoise*/         color(175,238,238),
                   /*54 aqua marine*/            color(127,255,212),
                   /*55 powder blue*/            color(176,224,230),
                   /*56 cadet blue*/             color(95,158,160),
                   /*57 steel blue*/             color(70,130,180),
                   /*58 corn flower blue*/       color(100,149,237),
                   /*59 deep sky blue*/          color(0,191,255),
                   /*60 dodger blue*/            color(30,144,255),
                   /*61 light blue*/             color(173,216,230),
                   /*62 sky blue*/               color(135,206,235),
                   /*63 light sky blue*/         color(135,206,250),
                   /*64 midnight blue*/          color(25,25,112),
                   /*65 navy*/                   color(0,0,128),
                   /*66 dark blue*/              color(0,0,139),
                   /*66 medium blue*/            color(0,0,205),
                   /*68 blue*/                   color(0,0,255),
                   /*69 royal blue*/             color(65,105,225),
                   /*70 blue violet*/            color(138,43,226),
                   /*71 indigo*/                 color(75,0,130),
                   /*72 dark slate blue*/        color(72,61,139),
                   /*73 slate blue*/             color(106,90,205),
                   /*74 medium slate blue*/      color(123,104,238),
                   /*75 medium purple*/          color(147,112,219),
                   /*76 dark magenta*/           color(139,0,139),
                   /*77 dark violet*/            color(148,0,211),
                   /*78 dark orchid*/            color(153,50,204),
                   /*79 medium orchid*/          color(186,85,211),
                   /*80 purple*/                 color(128,0,128),
                   /*81 thistle*/                color(216,191,216),
                   /*82 plum*/                   color(221,160,221),
                   /*83 violet*/                 color(238,130,238),
                   /*84 magenta / fuchsia*/      color(255,0,255),
                   /*85 orchid*/                 color(218,112,214),
                   /*86 medium violet red*/      color(199,21,133),
                   /*87 pale violet red*/        color(219,112,147),
                   /*88 deep pink*/              color(255,20,147),
                   /*89 hot pink*/               color(255,105,180),
                   /*90 light pink*/             color(255,182,193),
                   /*91 pink*/                   color(255,192,203),
                   /*92 antique white*/          color(250,235,215),
                   /*93 beige*/                  color(245,245,220),
                   /*94 bisque*/                 color(255,228,196),
                   /*95 blanched almond*/        color(255,235,205),
                   /*96 wheat*/                  color(245,222,179),
                   /*97 corn silk*/              color(255,248,220),
                   /*98 lemon chiffon*/          color(255,250,205),
                   /*99 light golden rod yellow*/color(250,250,210),
                   /*100 light yellow*/          color(255,255,224),
                   /*101 saddle brown*/          color(139,69,19),
                   /*102 sienna*/                color(160,82,45),
                   /*103 chocolate*/             color(210,105,30),
                   /*104 peru*/                  color(205,133,63),
                   /*105 sandy brown*/           color(244,164,96),
                   /*106 burly wood*/            color(222,184,135),
                   /*107 tan*/                   color(210,180,140),
                   /*108 rosy brown*/            color(188,143,143),
                   /*109 moccasin*/              color(255,228,181),
                   /*110 navajo white*/          color(255,222,173),
                   /*111 peach puff*/            color(255,218,185),
                   /*112 misty rose*/            color(255,228,225),
                   /*113 lavender blush*/        color(255,240,245),
                   /*114 linen*/                 color(250,240,230),
                   /*115 old lace*/              color(253,245,230),
                   /*116 papaya whip*/           color(255,239,213),
                   /*117 sea shell*/             color(255,245,238),
                   /*118 mint cream*/            color(245,255,250),
                   /*119 slate gray*/            color(112,128,144),
                   /*120 light slate gray*/      color(119,136,153),
                   /*121 light steel blue*/      color(176,196,222),
                   /*122 lavender*/              color(230,230,250),
                   /*123 floral white*/          color(255,250,240),
                   /*124 alice blue*/            color(240,248,255),
                   /*125 ghost white*/           color(248,248,255),
                   /*126 honeydew*/              color(240,255,240),
                   /*127 ivory*/                 color(255,255,240),
                   /*128 azure*/                 color(240,255,255),
                   /*129 snow*/                  color(255,250,250),
                   /*130 black*/                 color(0,0,0),
                   /*131 dim gray*/              color(105,105,105),
                   /*132 gray*/                  color(128,128,128),
                   /*133 dark gray*/             color(169,169,169),
                   /*134 silver*/                color(192,192,192),
                   /*135 light gray*/            color(211,211,211),
                   /*136 gainsboro*/             color(220,220,220),
                   /*137 white smoke*/           color(245,245,245),
                   /*138 white*/                 color(255,255,255)
                   };
int count[] = new int[colors.length];
int msc = 0;//remove
int yes = 0;//remove
void setup() 
{
  img = loadImage("pic5.png");
  size(img.width, img.height);
  amount();
  //Menu
  float menuHeight = img.height * 0.05f;
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(img.width, (int)menuHeight)
     .addItems(split("a b c"," "))
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
    }//End case 1 Bar Chart
    
    case 1://Sort Pixels
    {
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
      break;
    }//End case 2 Sort Pixels
    
    case 2://Display Orignal Image
    {
       image(img, 0, 0);
    }//End case 3 Display Orignal Image
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

void keyPressed()
{
  //Change mode
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }//End if
}//End keyPressed()

//Count amount of pixels for each color
void amount()
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
      yes=0;
      for(int i = 0; i<colors.length; i++)
      {
        if(img.pixels[loc] == colors[i])
        {
          count[i]++;
        }//End if
      }//End for i
    }//End for x
  }//End for y
  println(msc);
}//End amount()
