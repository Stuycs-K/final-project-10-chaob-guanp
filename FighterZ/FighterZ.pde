import java.io.*;
import java.util.*;
import java.awt.*;

public final int UP = 0;
public final int LEFT = 1;
public final int DOWN = 2;
public final int RIGHT = 3;
public final int LIGHT = 4;
public final int MEDIUM = 5;
public final int HEAVY = 6;
public final int SPECIAL = 7;
public boolean display = false;
public PImage arena;
public character Player1;
public character Player2;

void setup(){
  size(1000, 500);
  surface.setResizable(true);
  createArena();
  //windowResize(arena.width, arena.height);
  surface.setSize(arena.width, arena.height);
  frameRate(20);
  Player1 = new Goku(1);
  Player2 = new Goku(2);
}

void draw(){
  imageMode(CORNER);
  image(arena, 0, 0);
  MyPImage currentFrame1 = Player1.update();
  MyPImage currentFrame2 = Player2.update();
  checkCollisions(currentFrame1, currentFrame2);
  if (Player1.posX > Player2.posX && Player1.mirror == false){
    Player1.mirror = true;
    Player2.mirror = false;
  }
  else if (Player1.posX <= Player2.posX && Player1.mirror == true){
    Player1.mirror = false;
    Player2.mirror = true;
  }
}

public void createArena(){
  File directory = new File(sketchPath("Mega Pack Extreme Butoden"));
  
  FileFilter filter = new FileFilter() {
    public boolean accept(File directory){
      return directory.getName().endsWith("png");
    }
  };
  
  File[] files = directory.listFiles(filter);
  Arrays.sort(files);
  
  MyPImage img = new MyPImage(files[(int) (Math.random() * (files.length) )]);
  arena = img.getImage();
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
   display = !display;
}

public void checkCollisions(MyPImage frame1, MyPImage frame2){
  for (int i = 0; i < frame1.hitboxes.size(); i++){
    Rectangle temp1 = frame1.hitboxes.get(i).rectangle;
    for (int j = 0; j < frame2.hitboxes.size(); j++){
      Rectangle temp2 = frame2.hitboxes.get(j).rectangle;
      // check if hitboxes intersect, then move them away properly. dont move along the y axis, move along x axis. y axis is bad because it can mess with jump positions.
      if (temp1.intersects(temp2)){
        Rectangle intersection = temp1.intersection(temp2);
        if (Player1.posX >= Player2.posX){
          Player1.posX += Math.ceil(intersection.getWidth() / 2);
          Player2.posX -= Math.ceil(intersection.getWidth() / 2);
        }
        else{
          Player1.posX -= Math.ceil(intersection.getWidth() / 2);
          Player2.posX += Math.ceil(intersection.getWidth() / 2);
        }
        if (display){
          stroke(0, 255, 0);
          fill(255, 255, 0, 160);
          rect((int) intersection.getX(), (int) intersection.getY(), (int) intersection.getWidth(), (int) intersection.getHeight());
        }
      }
    }
  }
}
