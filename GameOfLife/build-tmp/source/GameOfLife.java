import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GameOfLife extends PApplet {

GameObject cells [][];
float cellSize = 5;
int numberOfColumbs;
int numberOfRows; 
int fillpercentage = 20 ; 
int neighboursAlive;
int frameChange = 10;

float scaleFactor = 1.0f;
float translateX = 0.0f;
float translateY = 0.0f;

boolean pause = false;

public void setup() {
// size(900,900);

background(0);

matrixCalculation();
initialAliveCalculation() ;
}


public void draw() 
{
	frameRate(frameChange);
	drawBackroundEffect () ;

	translate(translateX,translateY);
	scale(scaleFactor);
	
	drawCellMatrixCalculation();
	checkAliveCellsCalculation();
	if(!pause) 
	{
		nextGenerationRulesCalculation();
	}
}
public class GameObject  
{

float x ;
float y ;
float size;
int neighbours; 
float xMode, yMode;
boolean alive = false;

	public GameObject (float x, float y, float size) 
	{
		this.x = x * size;
		this.y = y * size;
		this.size = size;
	}


	public void draw () 
	{
		xMode = 255f/PApplet.parseFloat(width);
		yMode = 255f/PApplet.parseFloat(height);
		colorMode(RGB);
		fill(x*xMode, y*yMode, 10, 150);
		noStroke();
		if (alive) 
		{
			rect(x, y, size, size);	
		}			
	}		
}
public void matrixCalculation()
{
	numberOfColumbs = (int)Math.floor(width/cellSize);
	numberOfRows = (int)Math.floor(height/cellSize);
	cells = new GameObject[numberOfColumbs][numberOfRows];
}


public void initialAliveCalculation() 
{
	for (int y = 0; y < numberOfRows; ++y) 
	{
		for (int x = 0; x < numberOfColumbs ; ++x) 
		{
			cells[x][y] = new GameObject(x, y, cellSize);
			
			if (random(0, 100) < fillpercentage) 
			{
				cells[x][y].alive = true;
			}
		}
	}
}


public void drawCellMatrixCalculation()
{
	for (int y = 0; y < numberOfRows; ++y) 
	{
		for (int x = 0; x < numberOfColumbs ; ++x) 
		{			
			cells[x][y].draw();
		}

	}
}


public void checkAliveCellsCalculation () 
{
for (int y = 0; y < numberOfRows; ++y) 
	{
		for (int x = 0; x < numberOfColumbs ; ++x) 
		{
neighboursAlive = 0 ;	
						 if (x-1 >= 0 && y-1 >= 0 && cells[x-1][y-1].alive == true) 
						{
							neighboursAlive++ ;	
						}			
						 if (y-1 >= 0 && cells[x][y-1].alive == true) 
						{
							neighboursAlive++ ;					
						}
						 if ( y-1 >= 0 && x+1 < numberOfColumbs && cells[x+1][y-1].alive == true) 
						{
							neighboursAlive++ ;	
						}
						 if (x-1 >= 0 && cells[x-1][y].alive == true) 
						{
							neighboursAlive++ ;					
						}
						if (x+1 < numberOfColumbs && cells[x+1][y].alive == true) 
						{
							neighboursAlive++ ;					
						}
						if (x-1 >= 0 && y+1 < numberOfRows && cells[x-1][y+1].alive == true) 
						{
							neighboursAlive++ ; 					
						}
						if (y+1 < numberOfRows && cells[x][y+1].alive == true) 
						{
							neighboursAlive++ ;	
						}
						if (x+1 < numberOfColumbs && y+1 < numberOfRows &&cells[x+1][y+1].alive == true) 
						{
							neighboursAlive++ ;	
						}		
cells[x][y].neighbours = neighboursAlive ;																				
		}
	}
}


public void nextGenerationRulesCalculation () 
{
	for (int y = 0; y < numberOfRows; ++y) 
	 {
		for (int x = 0; x < numberOfColumbs ; ++x) 
		{
			if (cells[x][y].alive == true && cells[x][y].neighbours < 2)  // die if less than 2 neighbors
			{
				cells[x][y].alive = false;
			
			}
			
			if (cells[x][y].alive == true && (cells[x][y].neighbours == 2 || cells[x][y].neighbours == 3)) // if 2 or 3 neogbor stay alive 
			{
				cells[x][y].alive = true;
			}
			
			if ( cells[x][y].neighbours > 3)   // 2 or less neighbor die
			{
				cells[x][y].alive = false;	
			}

			if (cells[x][y].alive == false && cells[x][y].neighbours == 3) {  // make new if 3 neborrs
				cells[x][y].alive = true;
			}
				
		}
	}
}

public void killCommand() 
{
for (int y = 0; y < numberOfRows; ++y) 
    {
      for (int x = 0; x < numberOfColumbs ; ++x) 
      {
        cells[x][y] = new GameObject(x, y, cellSize);
      
        cells[x][y].alive = false;
      
      }
    }
}
public void drawBackroundEffect () 
{
	fill(255, 255, 255, 10);
	rect(0, 0, width, height);	
}
public void keyPressed() 
{
  
  if (key == 'r') //zoom reset
  {
    scaleFactor = 1;
    translateX = 0.0f;
    translateY = 0.0f;
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

public void mouseWheel(MouseEvent event) 
{

  float delta = event.getCount();
  if (event.getCount()> 0) 
   {
      delta = delta* 1.05f;
   }
    else 
    {
      delta = delta *-(1/1.05f); 
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
      translateX = 0.0f;
      translateY = 0.0f;
  }
}


public void mouseDragged() 
{
  if (mousePressed && (mouseButton == LEFT)) 
   { 
      translateX += mouseX - pmouseX;
      translateY += mouseY - pmouseY;
   }




  

        
   if (mousePressed && (mouseButton == RIGHT))
    {
       cells[pmouseX/PApplet.parseInt(cellSize)][pmouseY/PApplet.parseInt(cellSize)].alive = true; 
    }

}

   
  public void settings() { 
fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GameOfLife" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
