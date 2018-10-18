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
  
  if (scaleFactor < 1) 
  {
    scaleFactor = 1;
  }
  if (scaleFactor == 1) 
  {
      translateX = 0.0;
      translateY = 0.0;
  }
}


void mouseDragged() 
{
  if (mousePressed && (mouseButton == LEFT)) 
   { 
      translateX += mouseX - pmouseX;
      translateY += mouseY - pmouseY;
   }




  

        
   if (mousePressed && (mouseButton == RIGHT))
    {
       cells[pmouseX/int(cellSize)][pmouseY/int(cellSize)].alive = true; 
    }

}

   
