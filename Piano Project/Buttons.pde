//DEFINES Button VARIABLES
class Button
{
  int x;
  int y;
  int height;
  int width;
}

//DEFINES stopButton VARIABLES
class stopButton
{
  int x;
  int y;
  int height;
  int width;
}

//DEFINES trackButton VARIAVLES
class trackButton
{
  int x;
  int y;
  int height;
  int width;
}

//DEFINES deleteButton VARIAVLES
class deleteButton
{
  int x;
  int y;
  int height;
  int width;
}

//DEFINES deleteButton VARIAVLES
class saveButton
{
  int x;
  int y;
  int height;
  int width;
}

//DEFINES deleteButton VARIAVLES
class loadButton
{
  int x;
  int y;
  int height;
  int width;
}

//CREATES THE RECORD KEY USING ARRAYS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void createRecordKey()
{
  for (int i=0; i<1; i=i+1)
  {
    recordKey[i] = new Button();
    recordKey[i].y=500;
    recordKey[i].width = 100;
    recordKey[i].x = 100;
    recordKey[i].height = 150;
  }
}

//DRAWS THE RECORD KEY
void showRecordKey() 
{
  for (int i=0; i<1; i=i+1) 
  {
    if (userActionNow==userActionRecord)
    {
      fill(0, 255, 0);
    } else if (recordKey[i].x + recordKey[i].width>mouseX && recordKey[i].x <mouseX && recordKey[i].y + recordKey[i].height>mouseY && recordKey[i].y <mouseY)
    {
      fill(255, 0, 0);
    } else
    {
      fill(255);
    }
    rect (recordKey[i].x, recordKey[i].y, recordKey[i].width, recordKey[i].height);
  }
}


//CREATES THE STOP RECORDING KEY USING ARRAYS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void createStopRecordKey()
{
  for (int i=0; i<1; i=i+1)
  {
    stopRecordKey[i] = new stopButton();
    stopRecordKey[i].y=500;
    stopRecordKey[i].width = 100;
    stopRecordKey[i].x = 300;
    stopRecordKey[i].height = 150;
  }
}

//DRAWS THE STOP RECORDING KEY
void showStopRecordKey() 
{
  for (int i=0; i<1; i=i+1) 
  {
    if (userActionNow==userActionStop)
    {
      fill(0, 255, 0);
    } else if (stopRecordKey[i].x + stopRecordKey[i].width>mouseX && stopRecordKey[i].x <mouseX && stopRecordKey[i].y + stopRecordKey[i].height>mouseY && stopRecordKey[i].y <mouseY)
    {
      fill(255, 0, 0);
    } else 
    {
      fill(255);
    }

    rect (stopRecordKey[i].x, stopRecordKey[i].y, stopRecordKey[i].width, stopRecordKey[i].height);
  }
}

//CREATES THE NEW TRACK KEY USING ARRAYS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void createTrackKey()
{
  for (int i=0; i<1; i=i+1)
  {
    showTrackKey[i] = new trackButton();
    showTrackKey[i].y=500;
    showTrackKey[i].width = 100;
    showTrackKey[i].x = 500;
    showTrackKey[i].height = 150;
  }
}

//DRAWS THE NEW TRACK KEY
void showTrackKey() 
{
  for (int i=0; i<1; i=i+1) 
  {
    if (userActionNow==userActionPlay)
    {
      fill(0, 255, 0);
    } else if (showTrackKey[i].x + showTrackKey[i].width>mouseX && showTrackKey[i].x <mouseX && showTrackKey[i].y + showTrackKey[i].height>mouseY && showTrackKey[i].y <mouseY)
    {
      fill(255, 0, 0);
    } else 
    {
      fill(255);
    }

    rect (showTrackKey[i].x, showTrackKey[i].y, showTrackKey[i].width, showTrackKey[i].height);
  }
}

//CREATES THE DELETE TRACK KEY USING ARRAYS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void deleteTrackKey()
{
  for (int i=0; i<1; i=i+1)
  {
    deleteTrackKey[i] = new deleteButton();
    deleteTrackKey[i].y=500;
    deleteTrackKey[i].width = 100;
    deleteTrackKey[i].x = 700;
    deleteTrackKey[i].height = 150;
  }
}

//DRAWS THE DELETE TRACK KEY
void showDeleteTrackKey() 
{
  for (int i=0; i<1; i=i+1) 
  {
    if (userActionNow==userActionDelete)
    {
      fill(0, 255, 0);
    } else if (deleteTrackKey[i].x + deleteTrackKey[i].width>mouseX && deleteTrackKey[i].x <mouseX && deleteTrackKey[i].y + deleteTrackKey[i].height>mouseY && deleteTrackKey[i].y <mouseY)
    {
      fill(255, 0, 0);
    } else 
    {
      fill(255);
    }

    rect (deleteTrackKey[i].x, deleteTrackKey[i].y, deleteTrackKey[i].width, deleteTrackKey[i].height);
  }
}

//CREATES THE SAVE TRACK BUTTON USING ARRAYS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void saveTrackKey()
{
  for (int i=0; i<1; i=i+1)
  {
    saveTrackKey[i] = new saveButton();
    saveTrackKey[i].y=500;
    saveTrackKey[i].width = 100;
    saveTrackKey[i].x = 900;
    saveTrackKey[i].height = 150;
  }
}

//DRAWS THE SAVE TRACK KEY
void showSaveTrackKey() 
{
  for (int i=0; i<1; i=i+1) 
  {
    if (userActionNow==userActionSave)
    {
      fill(0, 255, 0);
    } else if (saveTrackKey[i].x + saveTrackKey[i].width>mouseX && saveTrackKey[i].x <mouseX && saveTrackKey[i].y + saveTrackKey[i].height>mouseY && saveTrackKey[i].y <mouseY)
    {
      fill(255, 0, 0);
    } else 
    {
      fill(255);
    }

    rect (saveTrackKey[i].x, saveTrackKey[i].y, saveTrackKey[i].width, saveTrackKey[i].height);
  }
}

//CREATES THE LOAD TRACK KEY USING ARRAYS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void loadTrackKey()
{
  for (int i=0; i<1; i=i+1)
  {
    loadTrackKey[i] = new loadButton();
    loadTrackKey[i].y=500;
    loadTrackKey[i].width = 100;
    loadTrackKey[i].x = 1100;
    loadTrackKey[i].height = 150;
  }
}

//DRAWS THE LOAD TRACK KEY
void showloadTrackKey() 
{
  for (int i=0; i<1; i=i+1) 
  {
    if (userActionNow==userActionLoad)
    {
      fill(000, 255, 0);
    } else if (loadTrackKey[i].x + loadTrackKey[i].width>mouseX && loadTrackKey[i].x <mouseX && loadTrackKey[i].y + loadTrackKey[i].height>mouseY && loadTrackKey[i].y <mouseY)
    {
      fill(255, 0, 0);
    } else 
    {
      fill(255);
    }

    rect (loadTrackKey[i].x, loadTrackKey[i].y, loadTrackKey[i].width, loadTrackKey[i].height);
  }
}
