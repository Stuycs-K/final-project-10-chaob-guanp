import java.io.*;
import java.util.*;

final int UP = 0;
final int LEFT = 1;
final int DOWN = 2;
final int RIGHT = 3;
final int LIGHT = 4;
final int MEDIUM = 5;
final int HEAVY = 6;
final int SPECIAL = 7;
character Player1;
character Player2;
ArrayList<MyPImage> sprites1;
ArrayList<MyPImage> sprites2;
boolean displayHitboxes;

void setup(){
  size(500, 500);
  Player1 = new Goku(1);
  sprites1 = Player1.getSprites();
}

void draw(){
  try{
  background(255);
  Player1.update();
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

public void toggleHitboxes(){
  displayHitboxes = !displayHitboxes;
}
