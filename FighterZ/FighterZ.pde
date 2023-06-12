import java.io.*;
import java.util.*;
import java.awt.*;
//import processing.sound.*;
import ddf.minim.*;

public final int UP = 0;
public final int LEFT = 1;
public final int DOWN = 2;
public final int RIGHT = 3;
public final int LIGHT = 4;
public final int MEDIUM = 5;
public final int HEAVY = 6;
public final int SPECIAL = 7;
public final int ROSTER = 2;
public final int TIMER = 90;

public final int CHARACTERSELECT = 0;
public final int GAMESTART = 1;
public final int GAMERESULT = 2;

public ArrayList<MyPImage> characterFaces;
public boolean display = false;
public PImage arena;
public character Player1;
public character Player2;
public boolean gameStart;
public double timer;
public ArrayList<Button> buttons;
public Minim minim;
public AudioPlayer getHit1, getHit2, background, characterSelect, resultSound; 
public int Mode;
//public SoundFile backMusic, getHit;


void setup(){
  size(1000, 500);
  minim = new Minim(this);
  getHit1 = minim.loadFile("getHitSound.mp3");
  getHit2 = minim.loadFile("getHitSound2.mp3");
  background = minim.loadFile("backgroundSound2.mp3");
  characterSelect = minim.loadFile("characterSelectSound2.mp3");
  resultSound = minim.loadFile("resultMusic.mp3");
 
  
  surface.setResizable(true);
  frameRate(20);
  buttons = new ArrayList<Button>(1 + ROSTER);
  characterFaces = new ArrayList<MyPImage>(ROSTER);
  gameStart = false;
  timer = TIMER; // in seconds
  for(int i = 0; i < 1 + ROSTER; i++){
    buttons.add(new Button(new Rectangle(0, 0, 0, 0), "NULL"));
  }
  
  File directory = new File(sketchPath("Mega Pack Extreme Butoden" + File.separator + "Character Faces"));
  FileFilter filter = new FileFilter() {
    public boolean accept(File directory){
      return directory.getName().endsWith("png");
    }
  };
  File[] files = directory.listFiles(filter);
  Arrays.sort(files);
  
  for (int i = 0; i < files.length; i++){
    characterFaces.add(new MyPImage(files[i]));
  }
}

void draw(){
  surface.setResizable(true);
  for (int i = 0; i < buttons.size(); i++){
    buttons.set(i, new Button(new Rectangle(0, 0, 0, 0), "NULL"));
  }
  
  if (Player1 != null && Player2 != null && timer > 0){
    if (!(Player1.health <= 0 || Player2.health <= 0)){
      gameStart = true;
      if (arena == null){
        createArena();
        surface.setSize(arena.width, arena.height);
      }
    }
    else{
      gameStart = false;
      Mode = GAMERESULT;
    }
  }
  else{
    gameStart = false;
    Mode = GAMERESULT;
  }
  
  if (gameStart){ // In a round
    imageMode(CORNER);
    image(arena, 0, 0);
    Mode = GAMESTART;
    characterSelect.pause();
    characterSelect.rewind();
    background.play();
    MyPImage currentFrame1;
    MyPImage currentFrame2;
    if (Player1.stunned){ // overlap proper sprite if doing a combo/attack
      currentFrame2 = Player2.update();
      currentFrame1 = Player1.update();
    }
    else{
      currentFrame1 = Player1.update();
      currentFrame2 = Player2.update();
    }
    
    //Mirror
    if (Player1.posX + currentFrame1.getImage().width / 2 > Player2.posX - currentFrame2.getImage().width / 2 && Player1.mirror == false){ 
      Player1.mirror = true;
      Player1.posX += currentFrame1.getImage().width;
      Player2.mirror = false;
      Player2.posX -= currentFrame2.getImage().width;
    }
    else if (Player1.posX - currentFrame1.getImage().width / 2 < Player2.posX + currentFrame2.getImage().width / 2 && Player1.mirror == true){ 
      Player1.mirror = false;
      Player1.posX -= currentFrame1.getImage().width;
      Player2.mirror = true;
      Player2.posX += currentFrame2.getImage().width;
    }
    checkCollisions(currentFrame1, currentFrame2);
    drawHealth();
    timer -= ((float) 1 / (float) 20); // subtract 1/framerate
  }
  else{ // create result then character select
    if (Player1 != null && Player2 != null){
      createResult();
    }
    else{
      background.pause();
      background.rewind();
      createSelect();
      characterSelect.play();
    }
  }
  for (int i = 0; i < buttons.size(); i++){
    buttons.get(i).drawRect();
  }
}


public void drawHealth(){
  int timerSpace = 40;
  int outline = 4;
  rectMode(CORNERS); // rect(x middle, y top, x left/right, y bottom)
  stroke(0);
  //Player1 health outline
  strokeWeight(outline);
  noFill();
  rect((width - outline - timerSpace)/ 2, 0, 0, 30); 
  //Player2 health outline
  strokeWeight(outline);
  noFill();
  rect((width + outline + timerSpace) / 2, 0, width, 30); 
  //Player1 health
  strokeWeight(0);
  fill(0, 255, 0);
  
  if (Player1.health > 25 && Player1.health < (Player1.maxHealth / 2)) {
    fill(255, 195, 0);
  }
  else if (Player1.health <= 25){
    fill(164, 42, 4);
  }
  else if (Player1.health == 0) {
    Mode = GAMERESULT;
  }
  if (Player1.health >= 0){
    rect((width - outline - timerSpace) / 2, outline / 2, ((width - timerSpace)/2) - ( (float) Player1.health/Player1.maxHealth * ((width - timerSpace)/2) ) - (outline / 2), 30);
  }
  //Player2 health
  strokeWeight(0);
  fill(0, 255, 0);
  if (Player2.health > 25 && Player2.health < (Player2.maxHealth / 2)) {
    fill(255, 195, 0);
  }
  else if (Player2.health <= 25){
    fill(164, 42, 4);
  }
  else if (Player2.health == 0) {
    Mode = GAMERESULT;
  }
  if (Player2.health >= 0){
    rect((width + outline + timerSpace) / 2, outline / 2, ((width + timerSpace)/2) + ( (float) Player2.health/Player2.maxHealth * ((width - timerSpace)/2) ) + (outline / 2), 30);
  }
  
  //PlayerNames:
  //Player 1
  textAlign(LEFT);
  textSize(15);
  fill(255);
  text("Player 1", 3, 45);
  //Player 2
  textAlign(RIGHT);
  textSize(15);
  fill(255);
  text("Player 2", width-28, 45);
  
  //Timer
  int textSize = 30;
  textAlign(CENTER);
  textSize(textSize);
  fill(0);
  text((int) timer, width / 2, textSize);
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

public void createResult(){ // change to fit more results
  imageMode(CORNER);
  image(arena, 0, 0);
  Mode = GAMERESULT;
  MyPImage currentFrame1;
  MyPImage currentFrame2;
  if (Player1.health > 0){ // overlap proper sprite if alive
    currentFrame2 = Player2.update();
    currentFrame1 = Player1.update();
  }
  else{
    currentFrame1 = Player1.update();
    currentFrame2 = Player2.update();
  }
  
  //Mirror
  if (Player1.posX + currentFrame1.getImage().width / 2 > Player2.posX - currentFrame2.getImage().width / 2 && Player1.mirror == false){ 
    Player1.mirror = true;
    Player1.posX += currentFrame1.getImage().width;
    Player2.mirror = false;
    Player2.posX -= currentFrame2.getImage().width;
  }
  else if (Player1.posX - currentFrame1.getImage().width / 2 < Player2.posX + currentFrame2.getImage().width / 2 && Player1.mirror == true){ 
    Player1.mirror = false;
    Player1.posX -= currentFrame1.getImage().width;
    Player2.mirror = true;
    Player2.posX += currentFrame2.getImage().width;
  }
  checkCollisions(currentFrame1, currentFrame2);
  drawHealth();
  
  int buttonWidth = 90;
  buttons.set(0, new Button(new Rectangle((width / 2) - (buttonWidth / 2), 50, buttonWidth, buttonWidth / 2), "Menu"));
}

public void createSelect(){
  background(0);
  Mode = CHARACTERSELECT;
  timer = TIMER;
  int buttonWidth = 70;
  
  for (int i = 1; i <= ROSTER; i++){
    buttons.set(i, new Button(new Rectangle( (i * (width / (1 + ROSTER)) ) - (buttonWidth / 2), height / 2, buttonWidth, buttonWidth), characterFaces.get(i - 1).getName().substring(0, characterFaces.get(i - 1).getName().length() - 4), characterFaces.get(i - 1).getImage()));
  }
  
  if (arena != null){
    arena = null;
  }
  
  if (width != 1000 || height != 500){
    surface.setSize(1000, 500);
  }
  
  int textSize = 50;
  fill(255);
  textSize(textSize);
  textAlign(CENTER);
  if (Player1 == null){
    text("Select character for Player 1", width / 2, textSize + 20); 
  }
  else{
    text("Select character for Player 2", width / 2, textSize + 20); 
  }
}

/*
void updatePos(int x, int y) {
  if (overRestart(restartX, restartY, restartX2, restartY2)) {
    restartOver = true;
    fill(255, 255, 0);
  }
  else {
    restartOver = false;
  }
}

boolean overRestart(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && mouseY <= y && mouseY >= height-y) {
    return true;
  } 
  else {
    return false;
  }
}

void mousePressed(){
  if (overRestart(25, height-50, 140, height-100)) {
    Player1.health = Player1.maxHealth;
    Player2.health = Player2.maxHealth;
    Player1.posX = 50;
    Player1.posY = 0;
    Player2.posX = width-50;
    Player2.posY = 0;
  }
}
*/

void mousePressed(){
  for (int i = 0; i < buttons.size(); i++){
    Button current = buttons.get(i);
    if (!(current.name.equals("NULL"))){
      if (current.contains(mouseX, mouseY)){
        if (current.name.equals("Menu")){
          Player1 = null;
          Player2 = null;
        }
        else if (current.name.equals("Goku")){
          if (Player1 == null){
            Player1 = new Goku(1);
          }
          else if (Player2 == null){
            Player2 = new Goku(2);
          }
        }
        else if (current.name.equals("Vegeta")){
          if (Player1 == null){
            Player1 = new Vegeta(1);
          }
          else if (Player2 == null){
            Player2 = new Vegeta(2);
          }
        }
      }
    }
  }
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
  //Move them away so they dont pass through each other
  for (int i = 0; i < frame1.hitboxes.size(); i++){
    Rectangle temp1 = frame1.hitboxes.get(i).rectangle;
    for (int j = 0; j < frame2.hitboxes.size(); j++){
      Rectangle temp2 = frame2.hitboxes.get(j).rectangle;
      // check if hitboxes intersect, then move them away properly. dont move along the y axis, move along x axis. y axis is bad because it can mess with jump positions.
      if (temp1.intersects(temp2)){
        Rectangle intersection = temp1.intersection(temp2);
        int p1posX = Player1.posX;
        int p2posX = Player2.posX;
        if (p1posX >= p2posX){
          Player1.posX += Math.ceil(intersection.getWidth() / 2);
          Player2.posX -= Math.ceil(intersection.getWidth() / 2);
        }
        else{
          Player1.posX -= Math.ceil(intersection.getWidth() / 2) + 1;
          Player2.posX += Math.ceil(intersection.getWidth() / 2) + 1;
        }
        
        if (Player1.posX < 0){
          Player1.posX = 0;
        }
        else if (Player1.posX > width){
          Player1.posX = width;
        }
        if (Player2.posX < 0){
          Player2.posX = 0;
        }
        else if (Player2.posX > width){
          Player2.posX = width;
        }
        
        if (display){
          stroke(0, 255, 0);
          fill(255, 255, 0, 160);
          rect((int) intersection.getX(), (int) intersection.getY(), (int) intersection.getWidth(), (int) intersection.getHeight());
        }
      }
    }
  }
  //Now check hurtboxes to deal damage and stun


  for (int i = 0; i < frame1.hurtboxes.size(); i++){
    Hurtbox hurt = frame1.hurtboxes.get(i);
    for (int j = 0; j < frame2.hitboxes.size(); j++){
      Hitbox recieve = frame2.hitboxes.get(j);
      if (hurt.rectangle.intersects(recieve.rectangle) && Player1.alreadyHit == false){
        Player1.alreadyHit = true;
        if (Player2.blocking){
          Player2.health -= Math.ceil((float) hurt.damage / 10);
          Player2.stunTime = 3;
          Player2.stunned = true;
        }
        else{
          getHit2.rewind();
          getHit2.play();
          Player2.health -= hurt.damage;
          Player2.stunTime = hurt.stun;
          Player2.stunned = true;
        }
      }
    }
  }
  for (int i = 0; i < frame2.hurtboxes.size(); i++){
    Hurtbox hurt = frame2.hurtboxes.get(i);
    for (int j = 0; j < frame1.hitboxes.size(); j++){
      Hitbox recieve = frame1.hitboxes.get(j);
      if (hurt.rectangle.intersects(recieve.rectangle) && Player2.alreadyHit == false){
        Player2.alreadyHit = true;
        if (Player1.blocking){
          Player1.health -= Math.ceil((float) hurt.damage / 10);
          Player1.stunTime = 3;
          Player1.stunned = true;
        }
        else{
          getHit1.rewind();
          getHit1.play();
          Player1.health -= hurt.damage;
          Player1.stunTime = hurt.stun;
          Player1.stunned = true;
        }
      }
    }
  }
}
