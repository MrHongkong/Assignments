void keyPressed() 
{
  
  if (key == 'r') //zoom reset
  {
    scaleFactor = 1;
    translateX = 0.0;
    translateY = 0.0;
  }
 	if (key == '+') 
	{
		frameChange += 1;	
 	}

	if (key == '-') 
	{
		frameChange += -1;
	}

	if (frameChange > 60) 
	{
		frameChange = 60;
	}

	if (frameChange < 10) 
	{
		frameChange = 10;
	}

	if (keyCode == 32) // Kill command
  {
    killCommand();
  }

  if (key == 'n')
  {
    initialAliveCalculation(); 
  }
  if (key == 'p') {
    pause = !pause; 
     }
}

