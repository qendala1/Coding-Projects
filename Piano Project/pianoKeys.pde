
//DEFINES PIANO KEY VARIABLES
class pianoKey
{
  int x;
  int y;
  int height;
  int width;
  SoundFile note;
}

//CREATES WHITE PIANO KEYS
void createKey()
{
  for (int i=0; i<13; i=i+1) 
  {
    notes[i] = new pianoKey();
    notes[i].y = 750;
    notes[i].width = 100;
    notes[i].x = notes[i].width*i;
    notes[i].height =250;
    notes[i].note = new SoundFile(this, str(i)+".wav");
  }
}

//SUBPROGRAM FOR PIANO KEYS
void showPianoKeys() 
{
  for (int i=0; i<13; i=i+1) 
  {
    if (notes[i].x + notes[i].width>mouseX && notes[i].x <mouseX && notes[i].y + notes[i].height>mouseY && notes[i].y <mouseY)
    {
      fill(155, 240, 126);
    } else 
    {
      fill(255);
    }

    rect (notes[i].x, notes[i].y, notes[i].width, notes[i].height);
  }
}
