float zoom=1;
PImage patrik;
PImage hongkong;


void setup()
{
  size(768, 576);
    smooth(20);
 patrik = loadImage("patrik.jpg");
 hongkong = loadImage("hongkong.jpg");
 
}

int value = 0;
int r =0;


void draw()
{
  
   background(patrik);
   tint(0+value, 0+value);
image(hongkong, 0, 0);  

 // background (0, 20, 26);
  stroke(0+value, 255, 100, 255-value);
   translate(mouseX, mouseY);
  scale (zoom);
  
   //Stroke change with mouse
  strokeWeight(mouseX/30+mouseY/20);

 //rotation point set after mouse 




pushMatrix();

 rotate(radians(r)); 
 translate(-238, -107);
 //P
 
  line(+55, +30, +56, +135);
  arc(+70, +55, +55, +55, -1.5, HALF_PI);
  noFill();
  
  
  

  //a
  
   
   arc(+146, +115, 28, 32, -5.1, -2);
    arc(+129, +104, 52, 60, -1.6,  0);
     arc(+183, +103, 55, 55, 1.6, 3);
     
     
       

     
     //t
     line(+224, +37, +224, +110);
     line(+245, +65, +202, +74);
     arc(+238, +107, 28, 47, 0.8, 3);
     
   
     
     //r
      line(+286, +132, +286, +74);
     arc(+305, +96, 35, 50, -3.1, -1);

 
    
     
     //i
      line(+348, +131, +348, +74);
       line(+348, +56, +348, +44);

     
       
       //k
       line(+386, +131, +386, +44);
       line(+427, +73, +399, +106);
       line(+429, +135, +407, +113);
       
       
       
   popMatrix();
       
       
pushMatrix();
  

   rotate(radians(-r)); 
   translate(-238, -107);
    

 
     stroke(0+value, 255, 100, 0+value);
    
    
 //H
 
 
  line(+55, +30, +55, +130);
   line(+105, +30, +105, +130);
   line(+55, 80, +105, 80);
  noFill();
  
  
  

  //o
  
   
   arc(+258, +114, 28, 32, -8.7, -2);

     
     
       //n
      line(+184, +132, +185, +89);
     arc(+205, +124, 39, 47, -3.3, 0.3);


    //g
       
   arc(+146, +114, 28, 32, -8.7, -2);
         line(+271, +147, +271, +125);
         arc(+257, +152, 29, 30, -0.2, 1);

   
       
       //k
       line(+291, +131, +290, +44);
       line(+333, +73, +309, +106);
       line(+336, +135, +318, +113);

    
         
  //o
  
   
   arc(+361, +114, 28, 32, -8.7, -2);
        
   
   
        //n
      line(+390, +132, +390, +89);
     arc(+410, +124, 39, 47, -3.3, 0.3);


    //g
       
   arc(+458, +114, 28, 32, -8.7, -2);
         line(+472, +152, +472, +125);
         arc(+458, +152, 29, 30, -0.2, 1);
    
    
    
    
          

         popMatrix();
         
        
         //rotate clockwise
          r += 1;
// println("r: "+r);

        
}
 //change color when mouse prseed
void mousePressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }

} 
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
 zoom+= e/10;
 if ( zoom < 1/100000) zoom = 1;
 if ( zoom > 4) zoom = 1;
println(zoom);
}
