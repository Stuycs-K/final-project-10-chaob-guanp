import java.io.*;
import java.util.*;

<<<<<<< HEAD
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

=======
public final int UP = 0;
public final int LEFT = 1;
public final int DOWN = 2;
public final int RIGHT = 3;
public final int LIGHT = 4;
public final int MEDIUM = 5;
public final int HEAVY = 6;
public final int SPECIAL = 7;
public character Player1;
public character Player2;
public ArrayList<MyPImage> sprites1;
public ArrayList<MyPImage> sprites2;
public boolean displayHitboxes;

void setup(){
  size(1000, 500);
  Player1 = new Goku(1);
  sprites1 = Player1.getSprites();
}

void draw(){
  background(255);
  Player1.update();
}

public void createArena(){
}

public void createResult(){
  
}

void keyPressed(){
  if (key == '='){
    toggleHitboxes();
>>>>>>> 3fee41c2b1bd1dc7704c22bebddea3ab28faaa14
  }
  
  if (Player1 != null){
    if (key == Player1.getKeybinds()[UP]){
      Player1.up = true;
    }
    if (key == Player1.getKeybinds()[LEFT]){
      Player1.left = true;
    }
    if (key == Player1.getKeybinds()[DOWN]){
      Player1.down = true;
    }
    if (key == Player1.getKeybinds()[RIGHT]){
      Player1.right = true;
    }
    if (key == Player1.getKeybinds()[LIGHT]){
      Player1.light = true;
    }
    if (key == Player1.getKeybinds()[MEDIUM]){
      Player1.medium = true;
    }
    if (key == Player1.getKeybinds()[HEAVY]){
      Player1.heavy = true;
    }
    if (key == Player1.getKeybinds()[SPECIAL]){
      Player1.special = true;
    }
  }
}

void keyReleased(){
  if (Player1 != null){
    if (key == Player1.getKeybinds()[UP]){
      Player1.up = false;
    }
    if (key == Player1.getKeybinds()[LEFT]){
      Player1.left = false;
    }
    if (key == Player1.getKeybinds()[DOWN]){
      Player1.down = false;
    }
    if (key == Player1.getKeybinds()[RIGHT]){
      Player1.right = false;
    }
    if (key == Player1.getKeybinds()[LIGHT]){
      Player1.light = false;
    }
    if (key == Player1.getKeybinds()[MEDIUM]){
      Player1.medium = false;
    }
    if (key == Player1.getKeybinds()[HEAVY]){
      Player1.heavy = false;
    }
    if (key == Player1.getKeybinds()[SPECIAL]){
      Player1.special = false;
    }
  }
}

public void toggleHitboxes(){
  displayHitboxes = !displayHitboxes;
}
