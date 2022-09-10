
class box{
  float x,y,xSpeed,ySpeed,width,height;
}

box[] boxes=new box[100];

void setup(){

  size(500,500);
  for (int i=0; i<boxes.length; i=i+1){
    boxes[i] = new box();
    boxes[i].x = random(height);
    boxes[i].y = random(height);
    boxes[i].xSpeed = random(4)-2;
    boxes[i].ySpeed = random(4)-2;
    boxes[i].width=random(10);
    boxes[i].height=random(10);
  }
}

void draw(){
  background(0);
  for (int i=0; i<boxes.length; i=i+1) {
    boxes[i].x=boxes[i].x+boxes[i].xSpeed;
    boxes[i].y=boxes[i].y+boxes[i].ySpeed;
    if (boxes[i].x<0 || boxes[i].x >width){
      boxes[i].xSpeed = boxes[i].xSpeed * -1;
    }
     if (boxes[i].y<0 || boxes[i].y >width){
      boxes[i].ySpeed = boxes[i].ySpeed * -1;
    }
  rect(boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
  }
}
