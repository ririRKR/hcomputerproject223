float x, y, size;
float vx, vy;
ArrayList<PVector> positions;

float x2, y2;
float a;
int changePos, changeVel;

void setup(){
  size(700, 700);
  size = 50;
  x = width/2;
  y = height/2;
  changePos = 10;
  
  vx = 1;
  vy = 1;
  a = 1;
  
  positions = new ArrayList<PVector>();
  positions.add(new PVector(x, y));
  
}

void draw(){
  background(0);
  circle(x, y, size);
  circle(x2, y2, size);
  
}

void keyPressed(){
  if(keyCode == UP){
    y -= vy;
  } else if(keyCode == DOWN){
    y += vy;
  } else if(keyCode == LEFT){
    x -= vx;
  } else if(keyCode == RIGHT){
    x += vx;
  }
  
  //caps velocity
  if(vx<15){
   vx+=a;
  }
  if(vy<15){
   vy+=a;
  }
  
  storePosition();
  
  if (x>width) x = 0;
  else if (x<0) x = width;
  if (y<0) y = height;
  else if (y>height) y = 0;
}

void keyReleased(){
  vx = 0;
  vy = 0;
}

void storePosition(){
  PVector lastPosition = positions.get(positions.size()-1);
  PVector beforePosition;
  if(positions.size()>100){
    beforePosition = positions.get(positions.size() - 100);
  } else { 
    beforePosition = new PVector(x-100, y);
  }


  if(lastPosition.x != x && lastPosition.y !=y){
    positions.add(new PVector(x, y));
  } else println("same spot" + random(0, 5));
  
  
  //only 20 spots in arraylist
  if(positions.size()>100){
    positions.remove(0);
  }
  
  x2 = beforePosition.x;
  y2 = beforePosition.y;
  
  
}
