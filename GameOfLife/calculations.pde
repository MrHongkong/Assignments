void matrixCalculation()
{
	numberOfColumbs = (int)Math.floor(width/cellSize);
	numberOfRows = (int)Math.floor(height/cellSize);
	cells = new GameObject[numberOfColumbs][numberOfRows];
}


void initialAliveCalculation() 
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


void drawCellMatrixCalculation()
{
	for (int y = 0; y < numberOfRows; ++y) 
	{
		for (int x = 0; x < numberOfColumbs ; ++x) 
		{			
			cells[x][y].draw();
		}

	}
}


void checkAliveCellsCalculation () 
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


void nextGenerationRulesCalculation () 
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

