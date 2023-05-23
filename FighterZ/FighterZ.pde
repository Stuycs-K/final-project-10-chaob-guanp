import java.io.*;
import java.util.*;

ArrayList<PImage> sprts;
int counter;
boolean inward;
int[][] locations;

void setup(){
  size(500, 500);
  character Player1 = new Goku(1);
  sprts = Player1.getSprites();
  counter = 0;
}

void draw(){
  background(255);
  imageMode(CENTER);
  PImage img = sprts.get(counter);
  image(img, img.width/2, height - img.height/2);
  if (counter <= 0){
    inward = true;
  }
  else if (counter >= 3){
    inward = false;
  }
  if (inward){
    counter += 1;
  }
  else{
    counter -= 1;
  }
}

void createArena(){
}

void createResult(){
  
}
