int[] array={};
int size=1000;
final int ASCENDING=1;
final int DESCENDING=-1;
final int NONE=0;
int order=NONE;

final float ALOT=1;
final float NOTMUCH=0.5;
final float HARDLYANY=0.1;
float randomness=ALOT;

void setup() {
}
void draw() {
}

int[] bubbleSort(int[] array) {
  //bubble sort an array of integers
  int pass =1;
  while (pass < array.length-1) {
    int current =1;
    while (current < array.length-1) {
      if (array[current] >array[current + 1]) {
        int temp = array[current];
        array[current] = array[current+1];
        array[current+1] = temp;
      }
      current = current + 1;
    }
    pass = pass + 1;
  }

return array; //stub ;)
}

int[] selectionSort(int[] array) {
  int pass = 1;
  while(pass<array.length-1) {
    int current = pass + 1;
    int smallest = pass;
    while(current<=array.length-1) {
      if(array[current]<array[smallest]) {
        smallest = current;
      }
      current = current + 1;
    }
    int temp = array[smallest];
    array[smallest] = array[pass];
    array[pass] = temp;
    pass = pass + 1;
  }
  return array; //stub ;)
}

int[] insertionSort(int[] array) {
  int position = 1;
  while(position < array.length-1) {
    if(array[position] > array[position + 1]) {
      int temp = array[position + 1];
      int current = position;
      while(current > 0 && array[current] > temp) {
        array[current + 1] = array[current];
        current= current - 1;
      }
      array[current + 1] = temp;
    }
    position = position + 1;
  }
  return array; //stub ;)
}

void printArray(int[] array) {
  //shows all items of an array on one line
  for (int i=0; i<array.length; i++) {
    print(array[i], " ");
  }
  println();
}

void keyPressed() {
  array=createArray(size);

  int[] arrayCopy=new int[array.length];
  int startTime;

  arrayCopy(array, arrayCopy);
  print("Insertion sorting ... ");
  startTime=millis();
  insertionSort(arrayCopy);
  println(str(millis()-startTime)+"ms");

  arrayCopy(array, arrayCopy);
  print("Selection sorting ... ");
  startTime=millis();
  selectionSort(arrayCopy);
  println(str(millis()-startTime)+"ms");

  arrayCopy(array, arrayCopy);
  print("Bubble sorting ... ");
  startTime=millis();
  bubbleSort(arrayCopy);
  println(str(millis()-startTime)+"ms");
}

int[] createArray(int size) {
  println("\nCreating array of "+size+" integers.");
  array=new int[size];
  for (int i=0; i<size; i++) {
    array[i]=int(random(size*randomness)+i*order);
  }
  return array;
}
