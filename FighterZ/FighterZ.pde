import java.io.*;
import java.util.*;

ArrayList<PImage> sprts;
int counter;
int posX1;
int posY1;
int posX2;
int posY2;

void setup(){
  size(500, 500);
  character Player1 = new Goku(1);
  sprts = Player1.getSprites();
  counter = 0;
  posX1 = 0;
  posY1 = 250;
  posX2 = width - 25;
  posY2 = 275;
}

void draw(){

  try{
  background(255);
  image(sprts.get(counter), 0, 0);
  counter += 1;
  if (counter >= sprts.size()){
    counter = 0;
  }
  Thread.sleep(75);
  
  //testing the color n stuff
    Hitbox test1 = new Hitbox(posX2, posY2, 25, 25);
  Hitbox test2 = new Hitbox(posX1, posY1, 25, 25);
  if (!test1.checkCollides(test2, posX2, posY2, posX1, posY1)) {
      posX1+=10;
      posX2-=10;
  }

  }
  catch(InterruptedException e){
    print("Why ?");
  }
}

void createArena(){
}

void createResult(){
  
}
