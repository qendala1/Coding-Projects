class playedKey {
  //WHICH PIANO KEY BY ITS NUMBER
  int pianoKey;
  //WHEN IT WAS PRESSED
  int millis;
}

//DEFINES TRACK VARIABLES
class track
{
  playedKey[] playedKeys = new playedKey[0];
  int lastKeyMilli = 0;

  //ADDS KEYS INTO A THE LAST TRACK
  void addKey(int pressedKey, int Duration) 
  {
    //ADD NEW KEY
    playedKeys=(playedKey[])append(playedKeys, new playedKey());

    //WHAT KEY YOU PLAYED
    tracks[tracks.length-1].playedKeys[tracks[tracks.length-1].playedKeys.length-1].pianoKey=pressedKey;

    if (Duration !=-1)
    {
      tracks[tracks.length-1].playedKeys[tracks[tracks.length-1].playedKeys.length-1].millis=Duration;
    } else if (lastKeyMilli!=0)
    {
      //THE DELAY BETWEEN THE TWO KEYS IN MILLIS
      tracks[tracks.length-1].playedKeys[tracks[tracks.length-1].playedKeys.length-1].millis=(millis()-lastKeyMilli);
    }

    lastKeyMilli=millis();
  }

  //LOOPS THROUGH THE TRACK AND PLAYS THE SONG
  void playTrack()
  {
    for (int t=0; t<=playedKeys.length-1; t=t+1 )
    {
      if (playedKeys[t].millis!=0)
      {
        delay(playedKeys[t].millis);
      }
      notes[playedKeys[t].pianoKey].note.play();
    }
  }
}

//ARRAY FOR TRACKS
track[] tracks=new track[0];

//CREATES A NEW TRACK
//------------------------------------------------------------------------------------------------------------------------------------------------------
void addTrack() 
{
  tracks=(track[])append(tracks, new track());
}

//STOPS THE RECORDING PROCESS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void stopTrack()
{
}

//FINDS WHAT KEY WAS LAST PLAYED\
//------------------------------------------------------------------------------------------------------------------------------------------------------
void addKeyToLastTrack(int pressedKey, int Duration) 
{
  //WHAT KEY YOU PLAYED
  tracks[tracks.length-1].addKey(pressedKey, Duration);
}

//REMOVES PLAYED KEYS FROM TRACKS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void deleteTrack()
{
  if (tracks.length!=0)
  {
    tracks=(track[])shorten(tracks);
  }
}

//SAVES PLAYED TRACKS TO FILE FROM TRACKS
//------------------------------------------------------------------------------------------------------------------------------------------------------
void saveTracksToFile()
{
  String[] trackList = new String[0];
  String track = "";

  for (int j=0; j<=tracks.length-1; j=j+1) 
  {
    track = "";
    for (int t=0; t<=tracks[j].playedKeys.length-1; t=t+1)
    {
      String millis = str(tracks[j].playedKeys[t].millis);
      String pianoKey = str(tracks[j].playedKeys[t].pianoKey);
      if (track!="")
      {
        track = track + keySeperator;
      }

      track = track + millis + fieldSeperator + pianoKey;
    }
    trackList=(String[])append(trackList, track);
  }

  // Writes the strings to a file, each on a separate line
  saveStrings("saveTracks.txt", trackList);
}

//LOADS THE TRACKS FROM THE FILE
//------------------------------------------------------------------------------------------------------------------------------------------------------
void loadTracksFromFile()
{
  tracks=new track[0];
  String[] trackList = loadStrings("saveTracks.txt");
  for (int i = 0; i <= trackList.length-1; i++) 
  {
    addTrack();
    String[] keyList = split(trackList[i], keySeperator);
    for (int j = 0; j <= keyList.length-1; j++) 
    {

      String[] keyField = split(keyList[j], fieldSeperator);

      addKeyToLastTrack(int(keyField[1]), int(keyField[0]));
    }
  }
}
