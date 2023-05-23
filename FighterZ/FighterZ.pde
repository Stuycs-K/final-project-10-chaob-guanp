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
  posY1 = height / 4;
  posX2 = width - 25;
  posY2 = width/4;
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
  Hurtbox test2 = new Hurtbox(posX1, posY1, 25, 25);
  if (!test1.checkCollides(test2)) {
      posX1++;
      posX2--;
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
