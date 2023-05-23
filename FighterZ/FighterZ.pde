import java.io.*;
import java.util.*;

ArrayList<PImage> sprts;
int counter;

void setup(){
  size(500, 500);
  character Player1 = new Goku(1);
  sprts = Player1.getSprites();
  counter = 0;
}

void draw(){
  try{
  background(0);
  image(sprts.get(counter), 0, 0);
  counter += 1;
  if (counter >= sprts.size()){
    counter = 0;
  }
  Thread.sleep(75);
  }
  catch(InterruptedException e){
    print("Why ?");
  }
}

void createArena(){
}

void createResult(){
  
}
