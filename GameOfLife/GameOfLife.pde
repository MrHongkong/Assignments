GameObject cells [][];
float cellSize = 5;
int numberOfColumbs;
int numberOfRows; 
int fillpercentage = 20 ; 
int neighboursAlive;
int frameChange = 10;

float scaleFactor = 1.0;
float translateX = 0.0;
float translateY = 0.0;

boolean pause = false;

void setup() {
// size(900,900);
fullScreen();
background(0);

matrixCalculation();
initialAliveCalculation() ;
}


void draw() 
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
