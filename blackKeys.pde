
//CREATES BLACK PIANO KEYS
void createBlackKey() 
{
  for (int i=0; i<13; i=i+1)
  {
    notes[i] = new pianoKey();
    notes[i].y=750;
    notes[i].width = 100;
    notes[i].x = notes[i].width*i;
    notes[i].height = 250;
    notes[i].note = new SoundFile(this, str(i)+".wav");
  }
}

//SUBPROGRAM FOR BLACK PIANO KEYS
void showBlackKeys() 
{
  for (int i=0; i<13; i=i+1) 
  {
    if (i==1 || i==3 || i==6 || i==8 || i==10)
    {
      if (notes[i].x + notes[i].width>mouseX && notes[i].x <mouseX && notes[i].y + notes[i].height>mouseY && notes[i].y <mouseY)
      {
        fill(255,192,203);
      } else 
      {
        fill(0);
      }

      rect (notes[i].x, notes[i].y, notes[i].width, notes[i].height);
    }
  }
}
