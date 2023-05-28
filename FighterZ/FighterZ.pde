import java.io.*;
import java.util.*;

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
public boolean displayHitboxes;





void setup(){
  size(1000, 500);
  frameRate(22);
  Player1 = new Goku(1);
  Player2 = new Goku(2);
}

void draw(){
  background(255);
  //if (!Player1.checkCollides(Player2.posX, Player2.posY, Player1.posX, Player1.posY)) {
    Player1.update();
    Player2.update();
  //}
  //else{
   // Player1.posX-=5;
  //}
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
 
  if (Player2 != null){
  if (key == Player2.getKeybinds()[UP]){
    Player2.up = true;
  }
  if (key == Player2.getKeybinds()[LEFT]){
    Player2.left = true;
  }
  if (key == Player2.getKeybinds()[DOWN]){
    Player2.down = true;
  }
  if (key == Player2.getKeybinds()[RIGHT]){
    Player2.right = true;
  }
  if (key == Player2.getKeybinds()[LIGHT]){
    Player2.light = true;
  }
  if (key == Player2.getKeybinds()[MEDIUM]){
    Player2.medium = true;
  }
  if (key == Player2.getKeybinds()[HEAVY]){
    Player2.heavy = true;
  }
  if (key == Player2.getKeybinds()[SPECIAL]){
    Player2.special = true;
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
  if (Player2 != null){
  if (key == Player2.getKeybinds()[UP]){
    Player2.up = false;
  }
  if (key == Player2.getKeybinds()[LEFT]){
    Player2.left = false;
  }
  if (key == Player2.getKeybinds()[DOWN]){
    Player2.down = false;
  }
  if (key == Player2.getKeybinds()[RIGHT]){
    Player2.right = false;
  }
  if (key == Player2.getKeybinds()[LIGHT]){
    Player2.light = false;
  }
  if (key == Player2.getKeybinds()[MEDIUM]){
    Player2.medium = false;
  }
  if (key == Player2.getKeybinds()[HEAVY]){
    Player2.heavy = false;
  }
  if (key == Player2.getKeybinds()[SPECIAL]){
    Player2.special = false;
  }
  }
}



public void toggleHitboxes(){
  displayHitboxes = !displayHitboxes;
}
public void reverseImage(){
  scale(-1.0, 1.0);
}
