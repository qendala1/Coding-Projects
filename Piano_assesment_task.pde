import processing.sound.*;

//GLOBAL VARIABLES
//------------------------------------------------------------------------------------------------------------------------------------------------------
//ARRAY USED FOR PIANO SOUNDS
pianoKey[] notes = new pianoKey[13];

//ARRAY USED FOR RECORD BUTTON
Button[] recordKey = new Button[1];

//ARRAY USED FOR STOP RECORDING BUTTON
stopButton[] stopRecordKey = new stopButton[1];

//ARRAY USED FOR NEW TRACK BUTTON
trackButton[] showTrackKey = new trackButton[1];

//ARRAY USED FOR DELETE RACK BUTTON
deleteButton[] deleteTrackKey = new deleteButton[1];

//ARRAY USED FOR SAVE TRACK BUTTON
saveButton[] saveTrackKey = new saveButton[1];

//ARRAY USED FOR LOAD TRACK BUTTON
loadButton[] loadTrackKey = new loadButton[1];

//USER ACTIONS
int userActionNow = 0;
int userActionRecord = 1; //record
int userActionStop = 2; //stop
int userActionDelete = 3; //delete
int userActionPlay = 4; //play
int userActionSave = 5; //save
int userActionLoad = 6; //load
int userActionBusy = 99; //program busy


//THERE ARE USED FOR UPLOAD AND DOWNLOAD TRACKS TO FILE
String keySeperator = "|";
String fieldSeperator = ",";
String Status = "";

void setup() 
{

  //DEFINES LAYOUT SIZE
  size(1300, 1000);
  //CALLS createKey SUBPROGRAM
  createKey();
  //CALLS creatBlackKey SUBPROGRAM
  createBlackKey();
  //CALLS createRecordKey SUBPROGRAM
  createRecordKey();
  //CALLS createStopRecordKey SUBPROGRAM
  createStopRecordKey();
  //CALLS createTrackKey SUBPROGRAM
  createTrackKey();
  //CALLS deleteTrackKey SUBPROGRAM
  deleteTrackKey();
  //CALLS loadTrackKey SUBPROGRAM
  loadTrackKey();
  //CALLS saveTrkackKey SUBPROGRAM
  saveTrackKey();
}



void draw()
{
  //MAKES THE BACKGROUND A COLOR
  background(137, 207, 240);
  //DRAWS A RECTANGLE AROUND COMMANDS
  rect(50, 450, 1200, 250, 28);
  //CALLS showPianoKeys SUBPROGRAM
  showPianoKeys();
  //CALLS showBlackKeys SUBPROGRAM
  showBlackKeys();
  //CALLS showRecordKey SUBPROGRAM
  showRecordKey();
  //CALLS showStopRecordKey SUBPROGRAM
  showStopRecordKey();
  //CALLS showTrackKey SUBPROGRAM
  showTrackKey();
  //CALLS showDeleteTrackKey SUBPROGRAM
  showDeleteTrackKey();
  //CALLS THE showLoadTrackKey SUBPROGRAM
  showloadTrackKey();
  //CALLS showSaveTrackKey SUBPROGRAM
  showSaveTrackKey();
  //CALLS noteNamers SUBPROGRAM
  noteNames();
  //CALLS showText SUBPROGRAM
  showText();
  //CALLS playNote SUBPROGRAM
  playNote();
  //CALL currentStatus SUBPROGRAM
  currentStatus();
}

void mouseClicked()
{
  //CALLS startRecord SUBPROGRAM
  startRecord();
  //CALLS loadTracks SUBPROGRAM
  loadTracks();
  //CALLS stopRecord SUBPROGRAM
  stopRecord();
  //CALLS saveTrack SUBPROGRAM
  saveTracks();
  //CALLS showTracks SUBPROGRAM
  showTracks();
  //CALLS deleteTracks SUBPROGRAM
  deleteTracks();
  //CALLS saveTracks SUBPROGRAM
  saveTracks();
}



//DEFINES WHEN THE NOTE SHOULD MAKE SOUND]
//------------------------------------------------------------------------------------------------------------------------------------------------------
void playNote() {
  for (int i=0; i<13; i=i+1) {
    if (notes[i].x + notes[i].width>mouseX && notes[i].x <mouseX && notes[i].y + notes[i].height>mouseY && notes[i].y <mouseY && mousePressed)
    {
      if (userActionNow==userActionRecord)
      {
        addKeyToLastTrack(i, -1);
      }
      notes[i].note.play();
      delay(150);
    }
  }
}

//STARTS THE RECORDING KEY PROCESS WHEN THE BUTTON IS CLICKED
//------------------------------------------------------------------------------------------------------------------------------------------------------
void startRecord()
{
  for (int i=0; i<1; i=i+1) {
    if (userActionNow==0 && recordKey[i].x + recordKey[i].width>mouseX && recordKey[i].x <mouseX && recordKey[i].y + recordKey[i].height>mouseY && recordKey[i].y <mouseY)
    {  
      Status = "record";
      userActionNow=userActionRecord;
      addTrack();
    }
  }
}


//STOPS THE RECORDING KEY PROCESS WHEN THE BUTTON IS CLICKED
//------------------------------------------------------------------------------------------------------------------------------------------------------
void stopRecord()
{
  for (int i=0; i<1; i=i+1) {
    if (userActionNow==userActionRecord && stopRecordKey[i].x + stopRecordKey[i].width>mouseX && stopRecordKey[i].x <mouseX && stopRecordKey[i].y + stopRecordKey[i].height>mouseY && stopRecordKey[i].y <mouseY)
    {
      userActionNow=userActionStop;
      Status = "stop";
      stopTrack();
      userActionNow=0;
    }
  }
}

//SHOWS THE PREVIOUS TRACKS AND PIANO STROKES
//------------------------------------------------------------------------------------------------------------------------------------------------------
void showTracks()
{
  for (int i=0; i<1; i=i+1) {
    if (userActionNow==0 && showTrackKey[i].x + showTrackKey[i].width>mouseX && showTrackKey[i].x <mouseX && showTrackKey[i].y + showTrackKey[i].height>mouseY && showTrackKey[i].y <mouseY)
    {
      userActionNow=userActionPlay;
      Status = "playing";
      for (int j=0; j<=tracks.length-1; j=j+1) {
        tracks[j].playTrack();
        delay(500);
      }
      userActionNow=0;
    }
  }
}

  //DELETES THE LAST RECORD IN THE TRACK
  //------------------------------------------------------------------------------------------------------------------------------------------------------
  void deleteTracks()
  {
    for (int i=0; i<1; i=i+1) {
      if (userActionNow==0 && deleteTrackKey[i].x + deleteTrackKey[i].width>mouseX && deleteTrackKey[i].x <mouseX && deleteTrackKey[i].y + deleteTrackKey[i].height>mouseY && deleteTrackKey[i].y <mouseY)
      {
        userActionNow=userActionDelete;
        Status = "delete";
        deleteTrack();
        userActionNow=0;
      }
    }
  }

  //SAVES THE TRACK TO A FILE WHEN THE BUTTON IS PRESSED
  //------------------------------------------------------------------------------------------------------------------------------------------------------
  void saveTracks()
  {
    for (int i=0; i<1; i=i+1) {
      if (userActionNow==0 && saveTrackKey[i].x + saveTrackKey[i].width>mouseX && saveTrackKey[i].x <mouseX && saveTrackKey[i].y + saveTrackKey[i].height>mouseY && saveTrackKey[i].y <mouseY)
      {
        userActionNow=userActionSave;
        Status = "save";
        saveTracksToFile();
        userActionNow=0;
      }
    }
  }

  //LOADS THE TRACK FROM FILES WHEN THE BUTTON IS PRESSED
  //------------------------------------------------------------------------------------------------------------------------------------------------------
  void loadTracks()
  {
    for (int i=0; i<1; i=i+1) {
      if (userActionNow==0 && loadTrackKey[i].x + loadTrackKey[i].width>mouseX && loadTrackKey[i].x <mouseX && loadTrackKey[i].y + loadTrackKey[i].height>mouseY && loadTrackKey[i].y <mouseY)
      {
        userActionNow=userActionLoad;
        Status = "load";
        loadTracksFromFile();
        delay(1000);
        userActionNow=0;
      }
    }
  }

  //DRAWS TEXT OVER THE BUTTONS
  //------------------------------------------------------------------------------------------------------------------------------------------------------
  void showText()
  {
    textSize(12);
    fill(0);
    text("RECORD", 125, 550);
    fill(0);
    text("STOP", 335, 550);
    fill(0);
    text("PLAY", 535, 550);
    fill(0);
    text("DELETE", 725, 550);
    fill(0);
    text("SAVE", 935, 550);
    fill(0);
    text("LOAD", 1135, 550);
  }

  //------------------------------------------------------------------------------------------------------------------------------------------------------
  void currentStatus()
  {
    textSize(100);
    fill(0);
    text("current status: " + Status, 150, 100);
  }

  // SUBPROGRAM TO DRAW NOTE NAMES --------------------------------------------------
  void noteNames()
  {
    textSize(20);
    //WHITE KEYS
    fill(0);
    text("C", 47, 890);
    text("D", 247, 890);
    text("E", 447, 890);
    text("F", 547, 890);
    text("G", 747, 890);
    text("A", 947, 890);
    text("B", 1147, 890);
    text("C", 1247, 890);

    //BLACK KEYS
    fill(255);
    text("C#", 147, 890);
    text("D", 347, 890);
    text("F#", 647, 890);
    text("G#", 847, 890);
    text("Bb", 1047, 890);
  }
