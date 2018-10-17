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


	void draw () 
	{
		xMode = 255f/float(width);
		yMode = 255f/float(height);
		colorMode(RGB);
		fill(x*xMode, y*yMode, 10, 150);
		noStroke();
		if (alive) 
		{
			rect(x, y, size, size);	
		}			
	}		
}