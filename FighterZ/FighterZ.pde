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
  windowResize(arena.width, arena.height);
  frameRate(20);
  Player1 = new Goku(1);
  Player2 = new Goku(2);
}

void draw(){
  imageMode(CORNER);
  image(arena, 0, 0);
  Player1.update();
  Player2.update();
  if (Player1.posX > Player2.posX && Player1.mirror == false){
    Player1.mirror = true;
    Player2.mirror = false;
    Player2.didSwap = false;
  }
  else if (Player1.posX <= Player2.posX && Player1.mirror == true){
    Player1.mirror = false;
    Player2.mirror = true;
    Player2.didSwap = true;
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
