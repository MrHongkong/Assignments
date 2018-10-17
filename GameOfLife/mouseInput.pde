void mouseWheel(MouseEvent event) 
{

  float delta = event.getCount();
  if (event.getCount()> 0) 
   {
      delta = delta* 1.05;
   }
    else 
    {
      delta = delta *-(1/1.05); 
    }
  
  translateX -= mouseX;
  translateY -= mouseY;
  scaleFactor *= delta;
  translateX *= delta;
  translateY *= delta;
  translateX += mouseX;
  translateY += mouseY;  
  println(scaleFactor);
  
}


void mouseDragged(MouseEvent event) 
{
  if (mousePressed && (mouseButton == LEFT)) 
   { 
    translateX += mouseX - pmouseX;
    translateY += mouseY - pmouseY;
   }
}