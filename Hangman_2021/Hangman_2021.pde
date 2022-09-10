//hangman 2021 //<>//

//initialise global variables
String[] words;
String word;
char guess;
char[] goodGuesses, badGuesses;
PImage[] hangmanImages;

void setup() {
  //called once to setup variables when program starts
  size(1000, 300);
  words=linesFromFile("words.txt");
  hangmanImages=getHangmanImages("man", ".png");
  newRound();
}

void draw() {
  //main game loop
  background(0);
 image(hangmanImages[badGuesses.length], 0, 0);
  showBadGuesses(badGuesses);
  showGoodGuesses(goodGuesses, word);
}

String[] linesFromFile(String words) {
  //load each line from a given filename into an array of Strings
  return loadStrings(words);
}


PImage[] getHangmanImages(String words, String extension) {
  //use a loop to load a series of numbered images from the data folder into an array of images
  //filename format = <filename><integer><extension> 
  PImage[] images=new PImage[7];
  for (int i=0; i<=images.length - 1; i=i+1 ) {
    images[i]=loadImage(words+str(i)+extension);
  }
  return images;
}

void newRound() {
  //start a new word-guessing round by resetting some arrays
  word=getWord(words);
  goodGuesses=new char[0];
  badGuesses=new char[0];
}

String getWord(String[] words) {
  //return a random word from the words array
  String word="";
  do {
    word = words[int(random(word.length()))];
  } while (word.length()>=3);
  return word;
}

void showBadGuesses(char[] badGuesses) {
  //show a list of previously-guessed letters that aren't in the target word
  textSize(20);
  fill(100);
  for (int i=0; i<=badGuesses.length - 1; i=i+1) {
    text(badGuesses[i], 200+i*20, height*0.75);
  }
}

//DONE
void showGoodGuesses(char[] goodGuesses, String word) {
  //show the target word with any correctly-guessed letters or underscores
  textSize(50);
  fill(200);
  for (int i=0; i <= word.length()-1; i=i+1) {  //go through each letter in the target word
    char thisChar='_'; //assume this letter hasn't been guessed 
    for (int j=0; i<= goodGuesses.length -1; i=i+1) { //loop through all guesses to see if this character has been guessed
      if (word.charAt(i)==goodGuesses[j]) {
        thisChar=word.charAt(i);
      }
    }
    text(thisChar, 200+i*50, height/2);
  }
}

//DONE
void keyPressed() {
  //let the user make a guess if the hangman is still alive
  if ( badGuesses.length<=hangmanImages.length-1) { 
    if ( inWord(key, word)) {  //the key pressed is in the word
      if (inGuesses(key, goodGuesses)) {
        goodGuesses=append(goodGuesses, key);
      } else {  //the key pressed is not in the word
        if (inGuesses(key, badGuesses)) {
          badGuesses=append(badGuesses, key);
        }
      }
    }
  }
}

//DONE
boolean inWord(char c, String word) {
  //returns true if a given character is in a word

  for (int i=0; i<=word.length()-1; i=i+1) {
    if (word.charAt(i)==c) {
      return true;
    }
  }
  return false;
}

//DONE
boolean inGuesses(char c, char[] guesses) {
  //returns true if a given character is in a given array of guesses

  for (int i=0; i<=guesses.length-1; i=i+1) {
    if (guesses[i]==c) {
      return true;
    }
  }
  return false;
}

//DONE
void mousePressed() {
  //start a new round 
  newRound();
}
