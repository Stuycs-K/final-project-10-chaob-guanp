import java.io.*;
import java.util.*;

character Player1;
character Player2;
ArrayList<MyPImage> sprites1;
ArrayList<MyPImage> sprites2;
boolean reverse;
boolean displayHitboxes;
int counter;
int counterStart;
int counterLimit;
int[][] locations;

void setup(){
  size(500, 500);
  Player1 = new Goku(1);
  sprites1 = Player1.getSprites();
  counterStart = findFirstSprite(sprites1, 0);
  counterLimit = findLastSprite(sprites1, 0);
  System.out.println(counterLimit);
  counter = counterStart;
  reverse = false;
}

void draw(){
  try{
  background(255);
  imageMode(CENTER);
  System.out.println(counter);
  PImage img = sprites1.get(counter).getImage();
  image(img, img.width/2, height - img.height/2); // the y coord should also account for jump height. 
  if (!reverse){
    counter += 1;
  }
  else{
    counter -= 1;
  }
  if (counter >= counterLimit || counter <= counterStart){
    reverse = !reverse;
  }
  Thread.sleep(75);
  }
  catch (InterruptedException e){
    print("Interrupted exception");
  }
}

public void createArena(){
}

public void createResult(){
  
}

void keyPressed(){
  if (key == '='){
    toggleHitboxes();
  }
  
  if (Player1 != null){
    if (key == Player1.keybinds[UP]){
    Player1.up = true;
  }
  if (key == Player1.keybinds[LEFT]){
    Player1.left = true;
  }
  if (key == Player1.keybinds[DOWN]){
    Player1.down = true;
  }
  if (key == Player1.keybinds[RIGHT]){
    Player1.right = true;
  }
  }
}

public int findFirstSprite(ArrayList<MyPImage> sprites, int value){
  for (int i = 0; i < sprites.size(); i++){
    if (sprites.get(i).getName().startsWith(value + "-")){
      return i;
    }
  }
  return -1;
}

public int findLastSprite(ArrayList<MyPImage> sprites, int value){
  for (int i = sprites.size() - 1; i >= 0; i--){
    if (sprites.get(i).getName().startsWith(value + "-")){
      return i;
    }
  }
  return -1;
}

public void toggleHitboxes(){
  displayHitboxes = !displayHitboxes;
}
