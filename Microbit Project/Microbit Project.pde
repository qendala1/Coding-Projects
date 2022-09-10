
int[] LED = new int[25];

int[] LEDtemp = new int[25];

void start()
{
  
  clearArray();
  
}

void draw()
{
  
  background(0);
  showLED();
  
}

void keyPressed()
{ 
  
  if (key == '1') clearArray();
  
  if (key == '2') randomise();
  
  if (key == '3') reverseArray();
  
  if (key == '4') wipeOff();
  
  if (key == '5') horizontolWrap();
  
  if (key == '6') verticalWrap();
  
  if (key == '7') rotate90();
  
  if (key == '8') rotationalChaser();
  
}

void showLED()
{

  for (int col = 0; col <=4; col++) 
  {
    for (int row = 0; row <=4; row++)
    {
      int i = row * 5 + col;

      if (LED[i] == 1)
      {
        square(col*20, row*20, 15);
      }
    }
  }
  
}

void randomise()
{

  for (int col = 0; col <=4; col++)
  {
    for (int row = 0; row <=4; row++) 
    {
      int i = row * 5 + col;
      LED[i] = int(random(0, 2));
    }
  }
  showLED();
  
}

void clearArray()
{ 
  
  for (int i=0; i<24; i++) 
  {
    LED[i]=0;
  }
  
}

void reverseArray()
{
  
  for (int col = 0; col< 5; col++) 
  {
    for (int row =0; row < 5; row++) 
    {
      int i = row * 5 + col;
      if (LED[i] == 0)
      {
        LED[i] = 1;
      } else {
        LED[i] = 0;
      }
    }
  }
  showLED();
  
}

void rotate90()
{
  
  for (int col = 0; col <= 4; col++)
  {
    for (int row = 0; row <= 4; row++) 
    {
      int i = row*5 +col;
      LEDtemp[i] = LED[i];
    }
  }
  for (int col = 0; col <= 4; col++) 
  {
    for (int row = 0; row <= 4; row++) 
    {
      int i = row *5 + col;
      LED[5*(i%5) + 4 - int(i/5)] = LEDtemp[i];
    }
  }
  showLED();
  
}

void wipeOff()
{
  
  for (int col = 0; col < 4; col++) 
  {
    for (int row = 0; row <= 4; row++)
    {
      int i = row * 5 + col;
      LED[i] = LED[row * 5 + (col+1)];
    }
  }

  for (int i = 0; i <=4; i++) 
  {
    LED[24-i*5] =0;
  }
  showLED();
  
}

void horizontolWrap() 
{
  
  for (int col = 0; col <= 4; col++) 
  {
    int temp = LED[col*5];
    for (int row = 0; row <= 3; row++) 
    {
      int i = col * 5 + row;
      LED[i] = LED[col * 5 + (row+1)];
    }
    LED[(col*5)+4] = temp;
  }
  showLED();
  
}

void verticalWrap()
{
  
  for (int col = 0; col < 5; col++) 
  {
    int temp = LED[col];
    for (int row = 0; row <= 3; row++)
    {
      int i = row * 5 + col;
      LED[i] = LED[(row+1)*5 + col];
    }
    LED[4*5 + col] = temp;
  }
  showLED();
  
}


void rotationalChaser() 
{
  
  int outerRingTemp = LED[0];
  int innerRingTemp = LED[6];
  for (int col = 0; col <= 3; col++)
  {
    int row = 0;
    int i = row*5 + col;
    LED[i] = LED[i + 1];
  }
  for (int row = 0; row <= 3; row++)
  {
    int col = 4;
    int i = row*5 + col;
    LED[i] = LED[i+5];
  }
  for (int col = 0; col <= 3; col++) 
  {
    int actualCol = 4 - col;
    int row = 4;
    int i = row*5 + actualCol;
    LED[i] = LED[i - 1];
  }
  for (int row = 0; row <= 3; row++) 
  {
    int col = 0;
    int actualRow = 4 - row;
    int i = actualRow*5 + col;
    LED[i] = LED[i - 5];
  }
  for (int col = 1; col <= 2; col++)
  {
    int row=1;
    int i = row*5 + col;
    LED[i] = LED[i+1];
  }
  for (int row = 1; row <= 2; row++)
  {
    int col = 3;
    int i = row*5 + col;
    LED[i] = LED[i + 5];
  }
  for (int col = 1; col <= 2; col++)
  {
    int actualCol = 4 - col;

    int row = 3;
    int i = row*5 + actualCol;

    LED[i] = LED[i - 1];
  }
  for (int row = 1; row <= 2; row++) 
  {
    int actualRow = 4 - row;
      int col = 1;
          int i = actualRow*5 + col;
      LED[i] = LED[i - 5];
  }
  LED[5] = outerRingTemp;
  LED[11] = innerRingTemp;
  showLED();
  
}
